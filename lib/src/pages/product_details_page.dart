import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:guanare_market/src/models/product_model.dart';
import 'package:guanare_market/src/theme/theme_light.dart';
import 'package:guanare_market/src/utils/get_assets.dart';

import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;
    final size = Get.size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(isBack: true),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: size.width,
                    child: ListView.separated(
                      itemCount: product.images.length, // product.images.length
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      separatorBuilder: (_, __) => SizedBox(width: 16),
                      itemBuilder: (_, int i) {
                        if (i == 0) {
                          return Hero(
                              tag: product.images[i],
                              child: customImage(product.images[i], size));
                        }

                        return customImage(product.images[i], size);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: CustomTheme.lightTheme.textTheme.headline2,
                        ),
                        SizedBox(height: 12),
                        Text('\$ ${product.priceFormated}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        SizedBox(height: 12),
                        Text(
                          'Deliveries prices not incluided.',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Text('Por '),
                            Text(
                              product.seller,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text('Ver más información del vendedor',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Fugiat ea incididunt cillum sit duis fugiat esse excepteur enim anim. Elit pariatur commodo laborum dolore consectetur qui aliqua. Reprehenderit aute sint exercitation dolor aliqua exercitation irure veniam ex exercitation in nulla aute.'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 140,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              height: 100,
              width: size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.zero))),
                onPressed: () {
                  Get.toNamed('cart');
                  Get.snackbar('Producto agregado',
                      'Se ha agregado el producto al carrito',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.white);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(getIcon('shopping-cart'),
                        color: palette.secondary['main'],
                        height: 22.0,
                        semanticsLabel: 'Cart'),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Agregar al carrito',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container customImage(String imageURL, Size size) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black45,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Image.asset(
          imageURL,
          fit: BoxFit.cover,
          width: size.width * 0.6,
          height: double.infinity,
        ),
      ),
    );
  }
}
