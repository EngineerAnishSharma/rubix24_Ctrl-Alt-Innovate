import 'package:application/consts/colors.dart';
import 'package:application/consts/lists.dart';
import 'package:application/consts/strings.dart';
import 'package:application/consts/styles.dart';
import 'package:application/home.dart';
import 'package:application/views/auth_screen/signup_screen.dart';
import 'package:application/widgets_common/applogo_widget.dart';
import 'package:application/widgets_common/bg_widget.dart';
import 'package:application/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/auth_controller.dart';
import '../../widgets_common/custome_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (context.screenHeight*0.1).heightBox,
              applogoWidget(),
              10.heightBox,// SizedBox
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(), //Text
              15.heightBox,
              Obx(()=>
                  Column(
                  children: [
                    customTextField(email,emailHint,controller.emailController,false),
                    customTextField(password, passwordHint,controller.passwordController,true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){

                      }, child: const Text(forgetPass)),
                    ),
                    5.heightBox,
                    controller.isLoading.value? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ):ourButton(
                        color1: redColor,
                        title: login,
                        textColor: whiteColor,
                        onPress: () async{
                          controller.isLoading(true);

                          await controller.loginMethod(context: context).
                          then((value){
                            if(value!=null){
                              VxToast.show(context, msg: loggedIn);
                              Get.to(const Home());
                            }else{
                              controller.isLoading(false);
                            }
                          });
                        })
                        .box.width(context.screenWidth-50).make(),
                    5.heightBox,
                    createNewAccount.text.color(fontGrey).make(),
                    5.heightBox,
                    ourButton(
                        color1: lightgolden,
                        title: signup,
                        textColor: redColor,
                        onPress: (){
                          Get.to(()=>const SignupScreen());
                        })
                        .box.width(context.screenWidth-50).make(),
                    10.heightBox,
                    loginWith.text.color(fontGrey).make(),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(socialIconList.length, (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: lightGrey,
                          child: Image.asset(socialIconList[index],width: 30,),
                        ),
                      )),
                    )
                  ],
                ).box.rounded.white.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
