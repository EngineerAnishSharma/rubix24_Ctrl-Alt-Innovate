import 'package:flutter/material.dart';
import 'package:tsec_hack/consts/colors.dart';

Widget loadingIndicator(){
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(redColor),
  );
}