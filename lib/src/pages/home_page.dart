import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Models
import 'package:guanare_market/src/models/category_model.dart';
import 'package:guanare_market/src/models/product_model.dart';

// Palette
import 'package:guanare_market/src/theme/palette.dart';

// Widgets
import 'package:guanare_market/src/widgets/Atoms/custom_floating_action_button.dart';
import 'package:guanare_market/src/widgets/Molecules/custom_bottom_navigation_bar.dart';
import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';
import 'package:guanare_market/src/widgets/Molecules/search_textfield.dart';
import 'package:guanare_market/src/widgets/Organisms/list_categories_horizontal.dart';
import 'package:guanare_market/src/widgets/Organisms/list_products_horizontal.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = Palette();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
          onPressed: () {},
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
                  subtitle: '¿Qué esperas para comprar?',
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: SearchTextField()),
                SizedBox(
                  height: 20,
                ),
                ListProductsHorizontal(
                  title: 'Novedades de hoy',
                  products: products,
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
                  height: 20,
                ),
                ListProductsHorizontal(
                  title: 'Más vendidos',
                  products: products,
                  height: 300,
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
