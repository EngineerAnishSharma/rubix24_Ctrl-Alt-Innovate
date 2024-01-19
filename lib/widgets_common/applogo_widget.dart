import 'package:flutter/widgets.dart';
// import 'package:tsec_hack/consts/images.dart';
import 'package:velocity_x/velocity_x.dart';

Widget applogoWidget() {
  //x_velocity
  return Image.asset('assets/images/appL.jpg')
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
