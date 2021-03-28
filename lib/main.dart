import 'package:flutter/material.dart';
import 'package:guanare_market/src/pages/cart_page.dart';

// Pages
import 'package:guanare_market/src/pages/home_page.dart';
import 'package:guanare_market/src/pages/menu_page.dart';

// Theme Light
import 'package:guanare_market/src/theme/theme_light.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      title: 'Guanare Market',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'cart': (_) => CartPage(),
        'menu': (_) => MenuPage(),
      },
    );
  }
}
