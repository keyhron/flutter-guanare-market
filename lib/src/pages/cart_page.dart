import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guanare_market/src/controllers/cart_controller.dart';

// Theme
import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/theme/theme_light.dart';

// Widgets
import 'package:guanare_market/src/widgets/Molecules/card_product_cart.dart';
import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';
import 'package:guanare_market/src/widgets/Molecules/floating_action_button_nav.dart';
import 'package:guanare_market/src/widgets/Molecules/floating_action_button_search.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final CartController cartController = Get.find();

    Widget _rowCart(String leftText, String rightText) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(
                color: palette.secondary.ultraDark.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          Text(rightText,
              style: CustomTheme.lightTheme.textTheme.headline4!
                  .copyWith(color: palette.secondary.main)),
        ],
      );
    }

    return Obx(() => Scaffold(
          floatingActionButton: cartController.cartProducts.length == 0
              ? SafeArea(
                  top: false,
                  bottom: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButtonNav(),
                          SizedBox(width: 10),
                          FloatingActionButtonSearch(),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: SafeArea(
            top: true,
            bottom: false,
            child: Container(
              height: size.height,
              width: size.width,
              child: (cartController.cartProducts.length == 0)
                  ? Center(child: Text('No tienes productos en el carrito.'))
                  : Column(
                      children: [
                        CustomAppBar(
                          title: 'Guanare Market',
                          subtitle: 'Carrito de compras',
                          isBack: true,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      itemCount:
                                          cartController.cartProducts.length,
                                      separatorBuilder: (_, __) => SizedBox(
                                            height: 12,
                                          ),
                                      itemBuilder: (_, i) => CardProductCart(
                                          cartController.cartProducts[i])),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                SafeArea(
                                  top: false,
                                  bottom: true,
                                  child: Container(
                                    width: double.infinity,
                                    height: 172,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 26.0),
                                    decoration: BoxDecoration(
                                        color: palette.primary.main,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 12,
                                              color: Colors.black
                                                  .withOpacity(0.05),
                                              spreadRadius: 1,
                                              offset: Offset(0.0, 0.0))
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
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
                                          color: palette.secondary.main
                                              .withOpacity(0.1),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total:',
                                              style: CustomTheme.lightTheme
                                                  .textTheme.headline4!
                                                  .copyWith(
                                                      color: palette
                                                          .secondary.ultraDark),
                                            ),
                                            Text('\$ ${cartController.total()}',
                                                style: CustomTheme.lightTheme
                                                    .textTheme.headline4!
                                                    .copyWith(
                                                        color: palette
                                                            .secondary.main)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
            ),
          ),
        ));
  }
}
