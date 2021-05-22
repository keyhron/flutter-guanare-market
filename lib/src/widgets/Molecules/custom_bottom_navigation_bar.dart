import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/utils/get_assets.dart' show getIcon;

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Palette palette = Palette();
    final size = MediaQuery.of(context).size;
    final routeName = Get.currentRoute;

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      elevation: 20,
      notchMargin: 7,
      child: SafeArea(
        bottom: true,
        top: false,
        child: Container(
          padding: EdgeInsets.only(
              left: size.width * 0.13, right: size.width * 0.13, top: 10),
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                borderRadius: BorderRadius.circular(100.0),
                color: routeName == 'home'
                    ? palette.primary['main']
                    : Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                        height: 50.0,
                        width: 50.0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                getIcon('home'),
                                height: 20.0,
                                color: routeName == 'home'
                                    ? Colors.white
                                    : palette.primary['main'],
                                semanticsLabel: 'Home',
                              ),
                            ],
                          ),
                        )),
                    onTap: () {
                      Get.toNamed('home');
                    }),
              ),
              Spacer(),
              Material(
                borderRadius: BorderRadius.circular(100.0),
                color: routeName == 'cart'
                    ? palette.primary['main']
                    : Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                        height: 50.0,
                        width: 50.0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(getIcon('shopping-cart'),
                                  color: routeName == 'cart'
                                      ? Colors.white
                                      : palette.primary['main'],
                                  height: 20.0,
                                  semanticsLabel: 'Cart'),
                            ],
                          ),
                        )),
                    onTap: () {
                      Get.toNamed('cart');
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
