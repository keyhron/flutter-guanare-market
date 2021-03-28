import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:guanare_market/src/theme/theme_light.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      prefix: Container(
          padding: EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset('assets/icons/search.svg',
              color: palette.secondary['lighter'], semanticsLabel: 'Search')),
      placeholder: 'Buscar',
      placeholderStyle: TextStyle(
          fontWeight: FontWeight.bold, color: CupertinoColors.placeholderText),
      cursorColor: palette.primary['main'],
      cursorHeight: 22,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 13.0),
      style: CustomTheme.lightTheme.textTheme.bodyText2,
      decoration: BoxDecoration(
          color: palette.secondary['dark'],
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
