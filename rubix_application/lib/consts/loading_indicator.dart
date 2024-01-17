import 'package:flutter/material.dart';
import 'package:rubix_application/consts/colors.dart';

Widget loadingIndicator(){
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(redColor),
  );
}