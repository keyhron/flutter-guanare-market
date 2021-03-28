import 'package:flutter/material.dart';
import 'package:guanare_market/src/theme/palette.dart';

// Widgets
import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Palette().primary['main'],
      body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Navbar(
                  title: 'Guanare Market',
                  subtitle: 'Menú de navegación',
                  dark: true,
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
