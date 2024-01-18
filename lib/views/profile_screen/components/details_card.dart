import 'package:tsec_hack/consts/consts.dart';

Widget detailsCard(width,String? count,String? title){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  ).box.rounded.white.width(width).height(80).make();
}