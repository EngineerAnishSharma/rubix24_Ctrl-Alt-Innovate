
import 'package:get/get.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/consts/lists.dart';
import 'package:tsec_hack/doctorApp/doctor_info.dart';
import 'package:tsec_hack/widgets_common/applogo_widget.dart';
import 'package:tsec_hack/widgets_common/bg_widget.dart';
import 'package:tsec_hack/widgets_common/custome_textfield.dart';
import 'package:tsec_hack/widgets_common/our_button.dart';

class DoctorSignup extends StatefulWidget {
  const DoctorSignup({super.key});

  @override
  State<DoctorSignup> createState() => _DoctorSignupState();
}

class _DoctorSignupState extends State<DoctorSignup> {
  bool? isCheck = false;
  // get everything from AuthController

  //controller input
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var retypePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 212, 97, 232), Colors.deepPurple],
      )),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox, // SizedBox
              "Join the Sarathi"
                  .text
                  .fontFamily(bold)
                  .white
                  .size(18)
                  .make(), //Text
              15.heightBox,
              Column(
                children: [
                  customTextField(name, nameHint, nameController, false),
                  customTextField(email, emailHint, emailController, false),
                  customTextField(
                      password, passwordHint, passwordController, true),
                  customTextField(
                      retypePass, passwordHint, retypePasswordController, true),

                  Row(
                    children: [
                      Checkbox(
                          checkColor: redColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = nameController.text.isNotEmpty &&
                                      emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty &&
                                      retypePasswordController.text.isNotEmpty
                                  ? newValue
                                  : false;
                            });
                          }),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                            text: "I agree to the $termAndCond",
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
                  ourButton(
                      color1: isCheck == true ? redColor : lightGrey,
                      title: signup,
                      textColor: whiteColor,
                      onPress: () async {
                        if (nameController.text.isNotEmpty &&
                            emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty &&
                            retypePasswordController.text.isNotEmpty) {
                          Get.to(() => DoctorInfo(
                                email: emailController.text,
                                username: nameController.text,
                              ));
                        } else {
                          VxToast.show(context,
                              msg: "Enter a required filled!");
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
                  ),
                  // "Sign up with".text.color(fontGrey).make(),
                  2.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        socialIconList.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  // switch (index) {
                                  //   case 0:
                                  //     break;
                                  //   case 1:
                                  //     controller.isLoading(true);
                                  //     await controller.signInWithGoogle();
                                  //     controller.isLoading(false);
                                  //     Get.to(() => const HomeScreen1());
                                  //     break;
                                  //   case 2:
                                  //     break;
                                  //   default:
                                  //     break;
                                  // }
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: lightGrey,
                                  child: Image.asset(
                                    socialIconList[index],
                                    width: 30,
                                  ),
                                ),
                              ),
                            )),
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
            ],
          ),
        ),
      ),
    )));
  }
}
