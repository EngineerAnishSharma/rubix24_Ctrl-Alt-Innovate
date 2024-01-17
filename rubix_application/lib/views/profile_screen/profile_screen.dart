import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rubix_application/consts/consts.dart';
import 'package:rubix_application/controller/auth_controller.dart';
import 'package:rubix_application/controller/profile_controller.dart';
import 'package:rubix_application/services/firestore_services.dart';
import 'package:rubix_application/views/auth_screen/login_screen.dart';
import 'package:rubix_application/views/profile_screen/components/edit_profile_screen.dart';
import 'package:rubix_application/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    var controller1 = Get.put(AuthController());
    return bgWidget(Scaffold(
        body: StreamBuilder(
      stream: FirestoreServices.getUser(currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
            ),
          );
        } else {
          var data = snapshot.data!.docs[0];
          // var card_count=data['card_count']
          return SafeArea(
            child: Column(children: [
              //edit
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: const Icon(
                      Icons.edit,
                      color: whiteColor,
                    ).onTap(() {
                      controller.nameController.text = data!['name'];
                      // controller.nameController.text = data['name'];

                      Get.to(EditProfileScreen(
                        data: data,
                      ));
                    })),
              ),
              //profile setting
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Image.asset(
                      imgProfile,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "${data['name']}"
                              .text
                              .fontFamily(semibold)
                              .white
                              .make(),
                          "${data['email']}"
                              .text
                              .white
                              .fontFamily(semibold)
                              .make(),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                        color: whiteColor,
                      )),
                      onPressed: () async {
                        await controller1.signoutMethod(context);
                        Get.offAll(const LoginScreen());
                      },
                      child: logout.text.white.fontFamily(semibold).make(),
                    )
                  ],
                ),
              ),
              10.heightBox,
              
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     detailsCard(context.screenWidth / 3.5, data['cart_count'],
              //         "In your cart"),
              //     detailsCard(context.screenWidth / 3.5, data['wishlist_count'],
              //         "In your wishlist"),
              //     detailsCard(context.screenWidth / 3.5, data['order_count'],
              //         "Your order"),
              //   ],
              // ).box.color(redColor).make(),
              //Button section
              // ListView.separated(
              //   shrinkWrap: true,
              //   separatorBuilder: (context, index) {
              //     return const Divider(
              //       color: lightGrey,
              //     );
              //   },
              //   itemCount: profileButtonsList.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return ListTile(
              //       onTap: () {
              //         // switch(index){
              //         //   case 0: Get.to(const WishlistScreen());
              //         //     break;
              //         //   case 1: Get.to(const OrdersScreen());
              //         //     break;
              //         //   case 2: Get.to(const MessageScreen());
              //         //     break;
              //         //   default:
              //         //     break;

              //         // }
              //       },
              //       leading: Image.asset(
              //         profileButtonsIcon[index],
              //         width: 22,
              //       ),
              //       title: profileButtonsList[index]
              //           .text
              //           .fontFamily(semibold)
              //           .color(darkFontGrey)
              //           .make(),
              //     );
              //   },
              // )
              //     .box
              //     .rounded
              //     .white
              //     .margin(const EdgeInsets.all(12))
              //     .padding(const EdgeInsets.symmetric(horizontal: 16))
              //     .shadowSm
              //     .make()
              //     .box
              //     .color(redColor)
              //     .make(),
            ]),
          );
        }
      },
    )));
  }
}

//   Widget build(BuildContext context) {
//     return bgWidget(
//         Scaffold(
//             body: SafeArea(
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 child: Column(
//                   children:[
//                 Align(
//                 child: Icon(Icons.edit, color: whiteColor,),
//               ),
//               Row(
//                 children: [
//                 Image.asset(imgProfile, width: 100, fit: BoxFit.cover,).box
//                   .roundedFull.make(),
//               ],
//             )
//             ]
//         )
//     )))
//     );
//   }
// }
