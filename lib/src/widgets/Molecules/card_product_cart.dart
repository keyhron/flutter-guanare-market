import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:guanare_market/src/controllers/cart_controller.dart';

import 'package:guanare_market/src/models/cart_model.dart';

import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/theme/theme_light.dart';

import 'package:guanare_market/src/utils/get_assets.dart' show getIcon;

class CardProductCart extends StatelessWidget {
  final Cart cart;
  CardProductCart(this.cart);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Container(
      width: double.infinity,
      height: 220,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white,
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
          GestureDetector(
            onTap: () {
              Get.toNamed('product-details', arguments: cart.product.id);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      cart.product.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '${cart.product.name}',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                        style: CustomTheme.lightTheme.textTheme.bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '\$ ${cart.product.priceFormated}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTheme.lightTheme.textTheme.headline2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                    child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: palette.secondary.main,
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.zero,
                                      left: Radius.circular(4.0)))),
                          onPressed: () {
                            cartController.updateProductCount(
                                id: cart.product.id, value: cart.count - 1);
                          },
                          child: SvgPicture.asset(getIcon('minus'),
                              color: palette.primary.main,
                              width: 20.0,
                              height: 20.0,
                              semanticsLabel: 'Minus')),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: palette.secondary.main,
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          elevation: 2,
                        ),
                        onPressed: () {},
                        child: Text('${cart.count}',
                            style: CustomTheme.lightTheme.textTheme.bodyText1),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: palette.secondary.main,
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.zero,
                                      right: Radius.circular(4.0)))),
                          onPressed: () {
                            cartController.updateProductCount(
                                id: cart.product.id, value: cart.count + 1);
                          },
                          child: SvgPicture.asset(getIcon('plus'),
                              width: 20.0,
                              height: 20.0,
                              color: palette.primary.main,
                              semanticsLabel: 'Plus')),
                    ),
                  ],
                )),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: TextButton.icon(
                    icon: SvgPicture.asset(getIcon('trash'),
                        width: 16.0,
                        height: 16.0,
                        color: palette.primary.lighter,
                        semanticsLabel: 'Delete'),
                    label: Text(
                      'Remover',
                      style: TextStyle(
                        fontSize: 14,
                        color: palette.primary.lighter,
                      ),
                    ),
                    onPressed: () {
                      cartController.deleteProduct(cart.product.id);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
