import 'package:flutter/material.dart';

TextStyle getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight);
}

SizedBox getSize(double heightSize, double weight) {
  return SizedBox(
    height: heightSize,
    width: weight,
  );
}
