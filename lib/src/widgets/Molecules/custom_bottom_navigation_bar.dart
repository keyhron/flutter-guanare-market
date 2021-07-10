import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/route_manager.dart';

import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/utils/get_assets.dart' show getIcon;

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _index = 0;

  @override
  void initState() {
    final routeName = Get.currentRoute;

    if (routeName == 'home') {
      _index = 0;
    }
    /* if (routeName == 'products') {
      _index = 1;
    } */
    if (routeName == 'cart') {
      _index = 1;
    }
    /* if (routeName == 'profile') {
      _index = 3;
    } */

    setState(() {});

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BottomAppBar(
      elevation: 10,
      shape: CircularNotchedRectangle(),
      notchMargin: 7,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: 10, horizontal: size.width * 0.08),
          child: GNav(
              haptic: true,
              tabBorderRadius: 10,
              color: palette.primary.main,
              activeColor: Colors.white,
              iconSize: 24,
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              gap: 10,
              selectedIndex: _index,
              onTabChange: (i) {
                if (i == 0) {
                  Get.toNamed('home');
                  setState(() {
                    _index = i;
                  });
                }
                /*  if (i == 1) {
                  print('Products');
                } */
                if (i == 1) {
                  Get.toNamed('cart');
                }
                /* if (i == 3) {
                  print('Profile');
                } */
                setState(() {
                  _index = i;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Inicio',
                  backgroundColor: palette.primary.main,
                  textColor: Colors.white,
                  leading: SvgPicture.asset(
                    _index == 0 ? getIcon('home-filled') : getIcon('home'),
                    color: _index == 0 ? Colors.white : palette.primary.main,
                    height: 20.0,
                    semanticsLabel: 'Cart',
                  ),
                ),
                /*   GButton(
                  icon: Icons.add_box,
                  leading: SvgPicture.asset(getIcon('shopping-bag'),
                      color:
                          _index == 1 ? Colors.white : palette.primary.main,
                      height: 20.0,
                      semanticsLabel: 'Products'),
                  text: 'Productos',
                  backgroundColor: palette.primary.main,
                  textColor: Colors.white,
                ), */
                GButton(
                  icon: Icons.favorite,
                  leading: SvgPicture.asset(
                    _index == 1
                        ? getIcon('shopping-cart-filled')
                        : getIcon('shopping-cart'),
                    color: _index == 1 ? Colors.white : palette.primary.main,
                    height: 20.0,
                    semanticsLabel: 'Cart',
                  ),
                  text: 'Carrito',
                  backgroundColor: palette.primary.main,
                  textColor: Colors.white,
                ),
                /* GButton(
                  icon: Icons.account_circle,
                  text: 'Perfil',
                  backgroundColor: palette.primary['main'],
                  textColor: Colors.white,
                ) */
              ]),
        ),
      ),
    );
  }
}
