import 'package:flutter/material.dart';
import 'package:guanare_market/src/theme/palette.dart';

final palette = new Palette();

final themeLight = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: palette.primary['main'],
    accentColor: palette.primary['main'],

    // Define the default font family.
    fontFamily: 'Abel',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(
          color: palette.text['main'],
          fontSize: 32.0,
          fontFamily: 'Passion One',
          fontWeight: FontWeight.normal),
      headline2: TextStyle(
          color: palette.text['main'],
          fontSize: 24.0,
          fontFamily: 'Passion One',
          fontWeight: FontWeight.normal),
      headline4: TextStyle(
          color: palette.text['main'],
          fontSize: 20.0,
          fontFamily: 'Passion One',
          fontWeight: FontWeight.normal),
      headline6: TextStyle(
          color: palette.text['main'],
          fontSize: 16.0,
          fontFamily: 'Passion One',
          fontWeight: FontWeight.normal),
      bodyText1: TextStyle(
        color: palette.text['disabled'],
        fontSize: 16.0,
      ),
      bodyText2: TextStyle(
        color: palette.text['main'],
        fontSize: 18.0,
      ),
    ));
