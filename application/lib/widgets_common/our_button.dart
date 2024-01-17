import 'package:application/consts/styles.dart';
import 'package:flutter/material.dart';

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