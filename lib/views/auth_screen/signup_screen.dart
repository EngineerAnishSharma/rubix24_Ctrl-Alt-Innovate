import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsec_hack/consts/colors.dart';
import 'package:tsec_hack/consts/firebase_const.dart';
import 'package:tsec_hack/consts/strings.dart';
import 'package:tsec_hack/consts/styles.dart';
import 'package:tsec_hack/controller/auth_controller.dart';
import 'package:tsec_hack/controller/localization_controller.dart';
import 'package:tsec_hack/views/onboarding_screen/onboarding.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custome_textfield.dart';
import '../../widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller =
      Get.put(AuthController()); // get everything from AuthController

  //controller input
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var retypePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox, // SizedBox
              Loc.get['signup'].text
                  .fontFamily(bold)
                  .white
                  .size(18)
                  .make(), //Text
              15.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(name, nameHint, nameController, false),
                    customTextField(email, emailHint, emailController, false),
                    customTextField(
                        password, passwordHint, passwordController, true),
                    customTextField(retypePass, passwordHint,
                        retypePasswordController, true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: const Text(forgetPass)),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: redColor,
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue;
                              });
                            }),
                        10.widthBox,
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: Loc.get["signup_agree"],
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              ),
                            ),
                            TextSpan(
                              text: termAndCond,
                              style: TextStyle(
                                fontFamily: bold,
                                color: redColor,
                              ),
                            ),
                            TextSpan(
                              text: ' & ',
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              ),
                            ),
                            TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontFamily: bold,
                                color: redColor,
                              ),
                            ),
                          ])),
                        ),
                      ],
                    ),
                    5.heightBox,
                    controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : ourButton(
                            color1: isCheck == true ? redColor : lightGrey,
                            title: signup,
                            textColor: whiteColor,
                            onPress: () async {
                              if (isCheck != false) {
                                try {
                                  controller.isLoading(true);
                                  await controller
                                      .signupMethod(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context)
                                      .then((value) {
                                    return controller.storeUserData(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text);
                                  }).then((value) {
                                    VxToast.show(context, msg: loggedIn);
                                    Get.offAll(() =>
                                        const Onboarding()); //delete all stack navigate to another screen
                                  });
                                } catch (e) {
                                  // VxToast.show(context, msg: e.toString());
                                  auth.signOut();
                                  controller.isLoading(false);
                                }
                              }
                            }).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    //Wrapping into Gesture Detector
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        alreadyHaveAccount.text.color(fontGrey).make(),
                        login.text.color(redColor).make().onTap(() {
                          Get.back();
                        }),
                      ],
                    )
                  ],
                )
                    .box
                    .rounded
                    .white
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
