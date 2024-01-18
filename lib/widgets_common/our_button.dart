import 'package:flutter/material.dart';
import 'package:tsec_hack/consts/styles.dart';

Widget ourButton({onPress,color1,textColor,title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color1,
      padding: const EdgeInsets.all(12),
    ), onPressed: onPress,
    child: Text(
      title,
      style: TextStyle(
        fontFamily:bold,
        color: textColor,
      ),

    ),
  );
}