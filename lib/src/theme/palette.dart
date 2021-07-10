import 'package:flutter/material.dart' show Color;

class _Primary {
  final lighter = Color(0xff4B494B);
  final light = Color(0xff3A3839);
  final main = Color(0xff2E2C2D);
  final dark = Color(0xff262425);
}

class _Secondary {
  final main = Color(0xffffffff);
  final dark = Color(0xfff3f3f3);
  final ultraDark = Color(0xffe6e6e6);
}

class _Status {
  final success = Color(0xff26c94f);
  final error = Color(0xfff44336);
  final warning = Color(0xfff0dc43);
}

class _Text {
  final white = Color(0xffffffff);
  final main = Color(0xff262425);
  final disabled = Color(0xff3A3839);
}

class _Palette {
  final primary = _Primary();
  final secondary = _Secondary();
  final status = _Status();
  final text = _Text();
}

final palette = _Palette();
