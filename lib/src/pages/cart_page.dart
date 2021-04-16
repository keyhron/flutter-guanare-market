import 'package:flutter/material.dart';

// Models
import 'package:guanare_market/src/models/product_model.dart';

// Theme
import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/theme/theme_light.dart';

// Widgets
import 'package:guanare_market/src/widgets/Atoms/custom_floating_action_button.dart';
import 'package:guanare_market/src/widgets/Molecules/card_product_cart.dart';
import 'package:guanare_market/src/widgets/Molecules/custom_bottom_navigation_bar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final palette = Palette();

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButtonSearch(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      CardProductCart(products[1]),
                      SizedBox(
                        height: 12,
                      ),
                      CardProductCart(products[2]),
                      SizedBox(
                        height: 12,
                      ),
                      CardProductCart(products[4]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                height: 172,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 26.0),
                decoration: BoxDecoration(
                    color: palette.primary['main'],
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 1,
                          offset: Offset(0.0, 0.0))
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cantidad de productos',
                          style: TextStyle(
                              color: palette.secondary['ultraDark']!
                                  .withOpacity(0.8),
                              fontWeight: FontWeight.bold),
                        ),
                        Text('3',
                            style: CustomTheme.lightTheme.textTheme.headline4!
                                .copyWith(color: palette.secondary['main'])),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Precios de productos',
                          style: TextStyle(
                              color: palette.secondary['ultraDark']!
                                  .withOpacity(0.8),
                              fontWeight: FontWeight.bold),
                        ),
                        Text('\$ 2,152.60',
                            style: CustomTheme.lightTheme.textTheme.headline4!
                                .copyWith(color: palette.secondary['main'])),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: palette.secondary['main']!.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: CustomTheme.lightTheme.textTheme.headline4!
                              .copyWith(color: palette.secondary['ultraDark']),
                        ),
                        Text('\$ 2,152.60',
                            style: CustomTheme.lightTheme.textTheme.headline4!
                                .copyWith(color: palette.secondary['main'])),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
