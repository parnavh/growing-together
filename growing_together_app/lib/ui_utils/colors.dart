import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyColors {
  static final Color neutral3 = Color(0xffd0ebff);
  static final Color neutral2 = Color(0xffd0ebff);
  static final Color neutral1 = Color(0xffd0ebff);

  static final Color white1 = Color(0xffd0ebff);
  static final Color white = Colors.white;

  static final Color accent1 = Color(0xff1c7ed6);
  static final Color accent2 = Color(0xff1c7ed6);
  static final Color accent3 = Color(0xff1c7ed6);

  static const int neutral3Hex = 0xff9d4edd;
  static const int neutral2Hex = 0xffb8c0ff;
  static const int neutral1Hex = 0xffc8b6ff;

  static MaterialColor getMaterialColor(int hex) => MaterialColor(hex,
      {
        50 : Color(hex),
        100 : Color(hex),
        200 : Color(hex),
        300 : Color(hex),
        400 : Color(hex),
        500 : Color(hex),
        600 : Color(hex),
        700 : Color(hex),
        800 : Color(hex),
        900 : Color(hex)});
}
