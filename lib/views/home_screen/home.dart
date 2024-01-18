import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tsec_hack/consts/colors.dart';
import 'package:tsec_hack/controller/home_controller.dart';
import 'package:tsec_hack/views/find_jobs/finding_job.dart';
import 'package:tsec_hack/views/profile_screen/components/profile_editor.dart';
import 'package:tsec_hack/widgets_common/community_screen.dart';
import 'package:tsec_hack/widgets_common/exit_dailog.dart';
import 'package:tsec_hack/widgets_common/postcard_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // AlanVoice.addButton(
    //             "f1c6d85569470059ccab0ada495ed2ac2e956eca572e1d8b807a3e2338fdd0dc/stage", // Replace with your Alan Studio project key
    //             buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT,
    //           );
    // // init home-controller
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
      const CommunityScreen(),
      const FindingJobScreen(),
      const PostCard(
          profilePicture: "https://placekitten.com/200/200",
          userName: "userName",
          content:
              "Lorem Ipsum is a placeholder text commonly used in the printing and typesetting industry. It doesn't carry any meaningful content but is often used to fill space in a document and give an impression of how the final text will look.",
          postimage: "https://placekitten.com/200/200",
          likes: 10),
      const ProfileEditor()
    ];

    // ignore: deprecated_member_use
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
                    child:
                        navbarBody.elementAt(controller.currentNavindex.value),
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
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     AlanVoice.addButton(
          //       "f1c6d85569470059ccab0ada495ed2ac2e956eca572e1d8b807a3e2338fdd0dc/stage", // Replace with your Alan Studio project key
          //       buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT,
          //     );
          //   },
          //   child: const Icon(Icons.question_mark),
          // ),
        ));
  }
}
