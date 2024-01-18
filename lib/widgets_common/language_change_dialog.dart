import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsec_hack/consts/colors.dart';
import 'package:tsec_hack/consts/styles.dart';
import 'package:tsec_hack/controller/local_storage.dart';
import 'package:tsec_hack/controller/localization_controller.dart';
import 'package:tsec_hack/widgets_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

Widget languageDialog(context) {
  bool isEnglish = false;
  LocalStorage.getBool("is_english", false).then((value) => isEnglish = value);
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Loc.get["language_confirm"].text
            .color(darkFontGrey)
            .fontFamily(bold)
            .size(18)
            .make(),
        const Divider(),
        10.heightBox,
        Loc.get["language_desc"].text.color(darkFontGrey).size(16).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
                color1: Colors.purple,
                onPress: () async {
                  isEnglish = !isEnglish;
                  LocalStorage.setBool("is_english", isEnglish);
                  SystemNavigator.pop();
                },
                textColor: whiteColor,
                title: Loc.get["yes"]),
            ourButton(
                color1: Colors.purple,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: whiteColor,
                title: Loc.get["no"]),
          ],
        )
      ],
    ).box.roundedSM.color(lightGrey).padding(const EdgeInsets.all(12.0)).make(),
  );
}