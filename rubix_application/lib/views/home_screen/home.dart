import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rubix_application/consts/colors.dart';
import 'package:rubix_application/controller/home_controller.dart';
import 'package:rubix_application/views/community/community_screen.dart';
import 'package:rubix_application/views/home_screen/home_screen.dart';
import 'package:rubix_application/views/home_screen/job_find.dart';
import 'package:rubix_application/views/profile_screen/profile_screen.dart';
import 'package:rubix_application/widgets_common/exit_dailog.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // init home-controller
    var controller = Get.put(HomeController());

    var navbarItem = [
      const Icon(
        Icons.home,
        size: 25,
        color: whiteColor,
      ),
      const Icon(
        Icons.book,
        size: 25,
        color: whiteColor,
      ),
      const Icon(
        Icons.abc,
        size: 25,
        color: whiteColor,
      ),
      const Icon(
        Icons.person,
        size: 25,
        color: whiteColor,
      ),
    ];

    var navbarBody = [
      const HomeScreen(),
      const FindJobScreen(),
      const CommunityScreen(),
      const ProfileScreen()
    ];

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => exitDialog(context),
        );
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
                  child: navbarBody.elementAt(controller.currentNavindex.value),
                )),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: controller.currentNavindex.value,
          color: Colors.orange,

          backgroundColor: whiteColor,
          height: 55,
          animationDuration:
              const Duration(milliseconds: 500), // Adjust animation duration
          animationCurve: Curves.easeInOut, // Adjust animation curve
          items: navbarItem,
          onTap: (value) {
            controller.currentNavindex.value = value;
          },

          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
