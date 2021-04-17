import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guanare_market/src/controllers/cart_controller.dart';

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

    final CartController cartController = Get.find();

    Widget _rowCart(String leftText, String rightText) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(
                color: palette.secondary['ultraDark']!.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          Text(rightText,
              style: CustomTheme.lightTheme.textTheme.headline4!
                  .copyWith(color: palette.secondary['main'])),
        ],
      );
    }

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
          child: (cartController.cartProducts.length == 0)
              ? Center(child: Text('No tienes productos en el carrito.'))
              : Column(
                  children: [
                    Expanded(
                      child: Obx(
                        () => ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemCount: cartController.cartProducts.length,
                            separatorBuilder: (_, __) => SizedBox(
                                  height: 12,
                                ),
                            itemBuilder: (_, i) => CardProductCart(
                                cartController.cartProducts[i])),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      height: 172,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 26.0),
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
                      child: Obx(
                        () => Column(
                          children: [
                            _rowCart('Cantidad de productos',
                                '${cartController.productsCount()}'),
                            SizedBox(
                              height: 16,
                            ),
                            _rowCart('Precios de productos',
                                '\$ ${cartController.productsPrices()}'),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color:
                                  palette.secondary['main']!.withOpacity(0.1),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total:',
                                  style: CustomTheme
                                      .lightTheme.textTheme.headline4!
                                      .copyWith(
                                          color:
                                              palette.secondary['ultraDark']),
                                ),
                                Text('\$ ${cartController.total()}',
                                    style: CustomTheme
                                        .lightTheme.textTheme.headline4!
                                        .copyWith(
                                            color: palette.secondary['main'])),
                              ],
                            )
                          ],
                        ),
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
