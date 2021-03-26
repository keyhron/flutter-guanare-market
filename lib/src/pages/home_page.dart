import 'package:flutter/material.dart';
// Widgets
import 'package:guanare_market/src/widgets/Molecules/navbar.dart';
import 'package:guanare_market/src/widgets/Molecules/search_textfield.dart';
import 'package:guanare_market/src/widgets/Organisms/list_products_horizontal.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
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
                ListProductsHorizontal()
              ],
            ),
          )),
    );
  }
}
