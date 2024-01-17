import 'package:application/consts/colors.dart';
import 'package:application/consts/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButtons(width,height,icon,String title,onPress){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon,width: 26,),
        5.heightBox,
        title.text.color(darkFontGrey).fontFamily(semibold).make(),
      ],
    ).box.rounded.shadowSm.size(width, height).white.make(),
  );
}