import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rubix_application/consts/colors.dart';
import 'package:rubix_application/consts/strings.dart';
import 'package:rubix_application/consts/styles.dart';
import 'package:rubix_application/controller/auth_controller.dart';
import 'package:rubix_application/views/auth_screen/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var controller1 = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                              color: whiteColor,
                            )),
                            onPressed: () async {
                              await controller1.signoutMethod(context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child:
                                logout.text.white.fontFamily(semibold).make(),
                          )),
    );
  }
}