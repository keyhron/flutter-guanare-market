import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guanare_market/src/controllers/cart_controller.dart';
import 'package:guanare_market/src/controllers/products_controller.dart';

import 'package:guanare_market/src/theme/theme_light.dart';
import 'package:guanare_market/src/utils/get_assets.dart';

import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String id = Get.arguments;
    final size = Get.size;

    final CartController cartController = Get.find();
    final ProductsController productsController = Get.find();
    final existProduct = productsController.existProduct(id);

    if (!existProduct) {
      Get.back();
      Get.snackbar('Página no disponible',
          'La página que intentas visitar no se encuentra disponible');
    }

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomAppBar(isBack: true),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: size.width,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount:
                          productsController.findProduct(id)!.images.length,
                      separatorBuilder: (_, __) => SizedBox(width: 16),
                      itemBuilder: (_, int i) {
                        if (i == 0) {
                          return Hero(
                              tag:
                                  productsController.findProduct(id)!.images[i],
                              child: customImage(
                                  productsController.findProduct(id)!.images[i],
                                  size));
                        }

                        return customImage(
                            productsController.findProduct(id)!.images[i],
                            size);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productsController.findProduct(id)!.name,
                          style: CustomTheme.lightTheme.textTheme.headline2,
                        ),
                        SizedBox(height: 12),
                        Text(
                            '\$ ${productsController.findProduct(id)!.priceFormated}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        SizedBox(height: 12),
                        Text(
                          'El precio de envío no está incluido.',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Text('Por '),
                            Text(
                              productsController.findProduct(id)!.seller,
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
                          'Descripción',
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
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.zero))),
                  onPressed: productsController.findProduct(id)!.isCart
                      ? () {}
                      : () {
                          if (productsController.findProduct(id) != null) {
                            cartController.newProduct(
                                productsController.findProduct(id)!);
                          }
                        },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!productsController.findProduct(id)!.isCart)
                        SvgPicture.asset(getIcon('shopping-cart'),
                            color: palette.secondary['main'],
                            height: 22.0,
                            semanticsLabel: 'Cart'),
                      if (!productsController.findProduct(id)!.isCart)
                        SizedBox(
                          width: 20,
                        ),
                      Text(
                        productsController.findProduct(id)!.isCart
                            ? 'El producto ya se encuentra en el carrito'
                            : 'Agregar al carrito',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customImage(String imageURL, Size size) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('photo-view', arguments: imageURL);
      },
      child: Container(
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
      ),
    );
  }
}
