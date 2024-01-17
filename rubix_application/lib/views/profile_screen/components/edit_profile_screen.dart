import 'dart:io';
import 'package:get/get.dart';
import 'package:rubix_application/consts/consts.dart';
import 'package:rubix_application/controller/profile_controller.dart';
import 'package:rubix_application/widgets_common/bg_widget.dart';
import 'package:rubix_application/widgets_common/custome_textfield.dart';
import 'package:rubix_application/widgets_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    // controller.nameController.text=data['name'];
    // controller.oldpassController.text=data['password'];

    return bgWidget(Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imgProfile,
                width: 100,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),

              // controller.profileImgPath.isEmpty?
              // Image.asset(imgProfile,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make():
              // Image.file(
              //   File(controller.profileImgPath.value),
              //   width: 100,
              //   fit: BoxFit.cover,
              // ).box.roundedFull.clip(Clip.antiAlias).make(),

              10.heightBox,
              ourButton(
                  onPress: () {
                    controller.changeImage(context);
                  },
                  color1: redColor,
                  textColor: whiteColor,
                  title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(name, nameHint, controller.nameController, false),
              10.heightBox,
              customTextField(
                  oldpass, passwordHint, controller.oldpassController, true),
              10.heightBox,
              customTextField(
                  newpass, passwordHint, controller.newpassController, true),
              20.heightBox,
              //loading
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.width - 60,
                      child: ourButton(
                          onPress: () async {
                            controller.isLoading(true);

                            //if image is not selected
                            // if (controller.profileImgPath.value.isEmpty) {
                            //   await controller.uploadProfileImage();
                            // } else {
                            //   controller.profileImageLink = data['imgUrl'];
                            // }

                            //old paswword database
                            if (data['password'] ==
                                controller.oldpassController.text) {
                              await controller.changeAuthPassword(
                                  data['email'],
                                  controller.oldpassController.text,
                                  controller.newpassController.text);

                              // await controller.uploadProfileImage();
                              await controller.updateProfile(
                                controller.profileImageLink,
                                controller.nameController.text,
                                controller.newpassController.text,
                              );
                              VxToast.show(context, msg: "Updated");
                            } else {
                              VxToast.show(context, msg: "Wrong password");
                              controller.isLoading(false);
                            }
                          },
                          color1: redColor,
                          textColor: whiteColor,
                          title: "Save")),
            ],
          )
              .box
              .white
              .shadowSm
              .rounded
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 16, right: 16))
              .make(),
        ),
      ),
    ));
  }
}
