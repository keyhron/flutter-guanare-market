import 'package:flutter/material.dart';
import 'package:guanare_market/src/theme/theme_light.dart' show palette;

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.primary['main'],
      body: Center(
        child: Text('Page'),
      ),
    );
  }
}
