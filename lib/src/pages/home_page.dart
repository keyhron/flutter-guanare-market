import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guanare_market/src/controllers/products_controller.dart';

// Models
import 'package:guanare_market/src/models/category_model.dart';

// Widgets
import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';
import 'package:guanare_market/src/widgets/Molecules/floating_action_button_nav.dart';
import 'package:guanare_market/src/widgets/Molecules/floating_action_button_search.dart';
import 'package:guanare_market/src/widgets/Molecules/search_textfield.dart';
import 'package:guanare_market/src/widgets/Organisms/list_categories_horizontal.dart';
import 'package:guanare_market/src/widgets/Organisms/list_products_horizontal.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ProductsController productsController = Get.find();

    return Scaffold(
      floatingActionButton: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FloatingActionButtonNav(),
            SizedBox(height: 10),
            FloatingActionButtonSearch(),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Guanare Market',
                  subtitle: '¿Qué esperas para comprar?',
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: SearchTextField()),
                SizedBox(
                  height: 20,
                ),
                ListProductsHorizontal(
                  title: 'Novedades de hoy',
                  products: productsController.products,
                  height: 300,
                ),
                SizedBox(
                  height: 20,
                ),
                ListCategoriesHorizontal(
                  categories: categories,
                  title: 'Categorías populares',
                  height: 106,
                ),
                SizedBox(
                  height: 46,
                ),
              ],
            ),
          )),
    );
  }
}
