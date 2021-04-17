import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

import 'package:guanare_market/src/theme/palette.dart';

// Theme
import 'package:guanare_market/src/theme/theme_light.dart';
import 'package:guanare_market/src/utils/get_assets.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool dark;
  final bool isBack;
  final bool backgroundOpacity;

  const CustomAppBar(
      {this.title,
      this.subtitle,
      this.dark = false,
      this.isBack = false,
      this.backgroundOpacity = false});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: backgroundOpacity ? Color(0xfffafafa) : Colors.transparent),
        child: SafeArea(
          top: true,
          bottom: false,
          child: validateAppBar(),
        ));
  }

  Widget validateAppBar() {
    final Palette palette = Palette();
    final routeName = Get.currentRoute;

    if (isBack) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  padding: EdgeInsets.all(10.0),
                  child:
                      Center(child: SvgPicture.asset(getIcon('chevron-left'))),
                ),
                onTap: () {
                  Get.back();
                }),
            Spacer(),
            Row(
              children: [
                InkWell(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      padding: EdgeInsets.all(10.0),
                      child: Center(child: SvgPicture.asset(getIcon('heart'))),
                    ),
                    onTap: () {}),
                InkWell(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      padding: EdgeInsets.all(10.0),
                      child:
                          Center(child: SvgPicture.asset(getIcon('share-2'))),
                    ),
                    onTap: () {}),
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.only(left: 26.0, right: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (this.title != null)
                Text(
                  this.title!,
                  style: CustomTheme.lightTheme.textTheme.headline2!.copyWith(
                      color: dark
                          ? palette.secondary['main']
                          : palette.primary['main']),
                ),
              if (this.subtitle != null)
                Text(
                  this.subtitle!,
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
                  Get.toNamed('menu');
                } else {
                  Get.back();
                }
              }),
        ],
      ),
    );
  }
}
