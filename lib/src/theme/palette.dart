import 'package:flutter/material.dart' show Color;

class Palette {
  final primary = {
    "lighter": Color(0xff4B494B),
    "light": Color(0xff3A3839),
    "main": Color(0xff2E2C2D),
    "dark": Color(0xff262425),
  };

  final secondary = {
    "main": Color(0xffffffff),
    "dark": Color(0xfff3f3f3),
    "ultraDark": Color(0xffe6e6e6),
  };

  final status = {
    "success": Color(0xff26c94f),
    "error": Color(0xfff44336),
    "warning": Color(0xfff0dc43),
  };

  final text = {
    "white": Color(0xffffffff),
    "main": Color(0xff262425),
    "disabled": Color(0xff3A3839),
  };
}
