import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guanare_market/src/theme/palette.dart';

// Theme
import 'package:guanare_market/src/theme/theme_light.dart';

class Navbar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool dark;

  const Navbar({required this.title, this.subtitle, this.dark = false});

  @override
  Widget build(BuildContext context) {
    final Palette palette = Palette();
    final routeName = ModalRoute.of(context)!.settings.name;

    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(left: 26.0, right: 12),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title,
                  style: CustomTheme.lightTheme.textTheme.headline2!.copyWith(
                      color: dark
                          ? palette.secondary['main']
                          : palette.primary['main']),
                ),
                Text(
                  this.subtitle ?? '',
                  style: CustomTheme.lightTheme.textTheme.bodyText1!.copyWith(
                      color: dark
                          ? palette.secondary['ultraDark']
                          : palette.primary['main']),
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
                    child: routeName != 'menu'
                        ? Column(
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
                          )
                        : Container(
                            child: SvgPicture.asset(
                              'assets/icons/x.svg',
                              color: palette.secondary['main'],
                            ),
                          ),
                  ),
                ),
                onTap: () {
                  if (routeName != 'menu') {
                    Navigator.pushNamed(context, 'menu');
                  } else {
                    Navigator.pop(context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
