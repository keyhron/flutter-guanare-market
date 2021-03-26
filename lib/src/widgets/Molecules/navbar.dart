import 'package:flutter/material.dart';
import 'package:guanare_market/src/theme/palette.dart';

// Theme
import 'package:guanare_market/src/theme/theme_light.dart';

class Navbar extends StatelessWidget {
  final String title;
  final String? subtitle;

  const Navbar({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final Palette palette = Palette();
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title,
                  style: themeLight.textTheme.headline2,
                ),
                Text(
                  this.subtitle ?? '',
                  style: themeLight.textTheme.bodyText1,
                ),
              ],
            ),
            Spacer(),
            InkWell(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 20,
                          height: 2,
                          color: palette.primary['main'],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 16,
                          height: 2,
                          color: palette.primary['main'],
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
