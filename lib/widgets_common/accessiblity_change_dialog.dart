import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsec_hack/consts/colors.dart';
import 'package:tsec_hack/consts/styles.dart';
import 'package:tsec_hack/controller/local_storage.dart';
import 'package:tsec_hack/controller/localization_controller.dart';
import 'package:tsec_hack/widgets_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

Widget AccessiblityDialog(context) {
  bool isBlind = false;
  LocalStorage.getBool("is_blind", false).then((value) => isBlind = value);
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Loc.get["accessiblity_confirm"].text
            .color(darkFontGrey)
            .fontFamily(bold)
            .size(18)
            .make(),
        const Divider(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
                color1: Colors.purple,
                onPress: () async {
                  isBlind = !isBlind;
                  LocalStorage.setBool("is_blind", isBlind);
                  Navigator.pop(context);
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
