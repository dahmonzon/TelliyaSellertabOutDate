import 'package:flutter/material.dart';
import 'dimen.dart';
import 'color.dart';

abstract class TStyle {
  static String fontFamily1 = "Roboto";
  
  static TextStyle h1 = TextStyle(
    color: TColor.h1,
    fontFamily: fontFamily1,
    fontWeight: FontWeight.bold,
    fontSize: Dimen.h1,
  );
  static TextStyle n1 = TextStyle(
    color: TColor.n1,
    // fontFamily: fontFamily1,
    fontWeight: FontWeight.w300,
    fontSize: Dimen.n1,
  );
}
