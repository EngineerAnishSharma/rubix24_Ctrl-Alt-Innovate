
import 'package:get/get.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/consts/lists.dart';
import 'package:tsec_hack/doctorApp/doctor_info.dart';
import 'package:tsec_hack/doctorApp/doctor_signup.dart';
import 'package:tsec_hack/widgets_common/applogo_widget.dart';
import 'package:tsec_hack/widgets_common/bg_widget.dart';
import 'package:tsec_hack/widgets_common/custome_textfield.dart';
import 'package:tsec_hack/widgets_common/our_button.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({super.key});

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 212, 97, 232), Colors.deepPurple],
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                applogoWidget(),
                10.heightBox, // SizedBox

                "Welcome to Recruiters login"
                    .text
                    .fontFamily(bold)
                    .white
                    .size(18)
                    .make(), //Text
                15.heightBox,
                Column(
                  children: [
                    customTextField(email, emailHint, emailController, false),
                    customTextField(
                        password, passwordHint, passwordController, true),
                    5.heightBox,
                    ourButton(
                        color1: redColor,
                        title: login,
                        textColor: whiteColor,
                        onPress: () async {
                          Get.to(() =>  DoctorInfo(email:emailController.text, username: 'Doctor',));
                        }).box.width(context.screenWidth - 50).make(),
                    5.heightBox,
                    createNewAccount.text.color(fontGrey).make(),
                    5.heightBox,
                    ourButton(
                        color1: lightgolden,
                        title: signup,
                        textColor: redColor,
                        onPress: () {
                          Get.to(() => const DoctorSignup());
                        }).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    loginWith.text.color(fontGrey).make(),
                    5.heightBox,
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
      )),
    );
  }
}
