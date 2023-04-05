import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle robotoRegular({
  Color color = Colors.black,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = 'Roboto',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}
