import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

// Models
import 'package:guanare_market/src/models/product_model.dart';

// Theme
import 'package:guanare_market/src/theme/theme_light.dart';

// Utils
import 'package:guanare_market/src/utils/get_assets.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct(this.product);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double widthCard = size.width * 0.6;

    return Container(
        width: widthCard,
        height: 300,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                child: Stack(
                  children: [
                    Hero(
                      tag: product.images[0],
                      child: Image.asset(
                        product.images[0],
                        fit: BoxFit.cover,
                        width: widthCard,
                        height: 200,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                          child: Container(
                            height: 60,
                            color: Colors.white.withOpacity(0.2),
                            width: widthCard,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('product-details',
                                          arguments: product);
                                    },
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: SvgPicture.asset(
                                            getIcon('shopping-cart'),
                                            color: palette.secondary['main'],
                                            height: 20.0,
                                            semanticsLabel: 'Cart')),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Container(
                                      child: SvgPicture.asset(
                                    getIcon('heart'),
                                    color: Colors.white,
                                    height: 20,
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            ClipRRect(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0)),
              child: Container(
                height: 100,
                width: widthCard,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: palette.secondary['main'],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      style: CustomTheme.lightTheme.textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$ ${product.priceFormated}',
                      style: CustomTheme.lightTheme.textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
