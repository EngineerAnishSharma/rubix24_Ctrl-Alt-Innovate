import 'package:flutter/widgets.dart';
import 'package:tsec_hack/consts/images.dart';

Widget bgWidget(Widget? child){
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.fill,
      )
    ),
    child: child,
  );
}