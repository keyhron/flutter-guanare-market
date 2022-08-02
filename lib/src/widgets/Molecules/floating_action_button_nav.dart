import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:guanare_market/src/theme/palette.dart';

// Theme
import 'package:guanare_market/src/utils/get_assets.dart';
import 'package:guanare_market/src/widgets/Atoms/custom_floating_action_button.dart';

class FloatingActionButtonNav extends StatelessWidget {
  final double size;
  FloatingActionButtonNav({this.size = 65.0});
  final currentRoute = Get.currentRoute;

  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      heroTag: 'fba-nav',
      size: this.size,
      color: palette.secondary.main,
      child: SvgPicture.asset(
        currentRoute == 'cart' ? getIcon('home') : getIcon('shopping-cart'),
        color: Colors.black,
        height: 20.0,
        semanticsLabel: currentRoute == 'cart' ? 'Home' : 'Cart',
      ),
      onPressed: () async {
        Get.toNamed(currentRoute == 'cart' ? 'home' : 'cart');
      },
    );
  }
}
