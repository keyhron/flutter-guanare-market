import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// Pages
import 'package:guanare_market/src/pages/cart_page.dart';
import 'package:guanare_market/src/pages/home_page.dart';
import 'package:guanare_market/src/pages/menu_page.dart';
import 'package:guanare_market/src/pages/product_details_page.dart';

// Theme Light
import 'package:guanare_market/src/theme/theme_light.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      title: 'Guanare Market',
      initialRoute: 'home',
      getPages: [
        GetPage(
            name: 'home',
            page: () => HomePage(),
            transition: Transition.noTransition),
        GetPage(
            name: 'cart',
            page: () => CartPage(),
            transition: Transition.noTransition),
        GetPage(name: 'menu', page: () => MenuPage()),
        GetPage(name: 'product-details', page: () => ProductDetailsPage()),
      ],
    );
  }
}
