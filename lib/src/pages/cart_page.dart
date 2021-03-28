import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Palette
import 'package:guanare_market/src/theme/palette.dart';

// Widgets
import 'package:guanare_market/src/widgets/Atoms/custom_floating_action_button.dart';
import 'package:guanare_market/src/widgets/Molecules/custom_bottom_navigation_bar.dart';
import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = Palette();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'cart');
          },
          child: SvgPicture.asset('assets/icons/search.svg',
              color: palette.secondary['main'], semanticsLabel: 'Search')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Navbar(
                  title: 'Guanare Market',
                  subtitle: 'Carrito de compras',
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          )),
    );
  }
}
