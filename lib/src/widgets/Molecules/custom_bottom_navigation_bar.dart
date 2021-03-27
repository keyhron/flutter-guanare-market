import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guanare_market/src/theme/palette.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Palette palette = Palette();
    final size = MediaQuery.of(context).size;
    // final route = ModalRoute.of(context)!.settings.name;

    return Container(
      height: 67,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  // decoration: BoxDecoration(
                  //   color: route == 'home'
                  //       ? palette.primary['main']
                  //       : Colors.transparent,
                  //   borderRadius: BorderRadius.circular(100.0),
                  // ),
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/home.svg',
                      // color: route != 'home'
                      //     ? palette.primary['main']
                      //     : palette.secondary['main'],
                      color: palette.primary['main'],
                      semanticsLabel: 'Home',
                    ),
                  ),
                ),
                onTap: () {
                  print('Click');
                }),
          ),
          Spacer(),
          Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/shopping-cart.svg',
                        color: palette.primary['main'], semanticsLabel: 'Cart'),
                  ),
                ),
                onTap: () {
                  print('Click');
                }),
          ),
        ],
      ),
    );
  }
}
