import 'package:flutter/material.dart';

abstract class Dimen {
  static Size _screen;
  static double _xblocSize;
  static double _yblocSize;

  static init(Size size) {
    _screen = size;
    _xblocSize = _screen.width / 100;
    _yblocSize = _screen.height / 100;
  }

  static Size get screen => _screen;
  static double get xblocSize => _xblocSize;
  static double get yblocSize => _yblocSize;
  static Size get featureBarSize => Size(_xblocSize * 10,_yblocSize * 100);
  static double get featureHeight => _yblocSize * 19;
  static double get h1 => _yblocSize * 3;
  static double get n1 => _yblocSize * 3;
  static Size get orderMenuSize => Size(_xblocSize * 78, _yblocSize * 10);
  static Size get orderMenuButtonSize => Size(_xblocSize * 20, _yblocSize * 6);
  static Size get orderRiderBarSize => Size(_xblocSize * 12,_yblocSize * 100);
  static double get orderListLeftMargin => _xblocSize * 3;
  static double get orderListRightMargin => _xblocSize * 6;
  static Size get orderListSize => Size(_xblocSize * 34, _yblocSize * 90);
  static double get orderListheaderHeight => _yblocSize * 5;
  static double get orderListcontentHeight => _yblocSize * 85;
  static Size get orderDetailSize => Size(_xblocSize * 35, _yblocSize * 75);

}
