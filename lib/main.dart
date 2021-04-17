import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controllers
import 'package:guanare_market/src/controllers/cart_controller.dart';
import 'package:guanare_market/src/controllers/products_controller.dart';

// Pages
import 'package:guanare_market/src/pages/cart_page.dart';
import 'package:guanare_market/src/pages/home_page.dart';
import 'package:guanare_market/src/pages/init_page.dart';
import 'package:guanare_market/src/pages/menu_page.dart';
import 'package:guanare_market/src/pages/product_details_page.dart';
import 'package:guanare_market/src/pages/seller_page.dart';
import 'package:guanare_market/src/pages/photo_view.dart';

// Theme Light
import 'package:guanare_market/src/theme/theme_light.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    Get.put(ProductsController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      title: 'Guanare Market',
      initialRoute: 'init',
      getPages: [
        GetPage(
            name: 'init',
            page: () => InitPage(),
            transition: Transition.noTransition),
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
        GetPage(name: 'seller', page: () => SellerPage()),
        GetPage(
            name: 'photo-view',
            page: () => PhotoViewPage(),
            transition: Transition.noTransition),
      ],
    );
  }
}
