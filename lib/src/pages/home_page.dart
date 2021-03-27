import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guanare_market/src/models/category_model.dart';
import 'package:guanare_market/src/models/product_model.dart';
import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/widgets/Molecules/custom_bottom_navigation_bar.dart';

// Widgets
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
      floatingActionButton: Container(
        // margin: EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          child: SvgPicture.asset('assets/icons/search.svg',
              color: palette.secondary['main'], semanticsLabel: 'Search'),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
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
                      height: size.height * 0.36,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListCategoriesHorizontal(
                      categories: categories,
                      title: 'Categorías populares',
                      height: size.height * 0.11,
                    ),
                    SizedBox(
                      height: 120,
                    ),
                  ],
                ),
              ),
              Positioned(bottom: 0, child: CustomBottomNavigationBar())
            ],
          )),
    );
  }
}
