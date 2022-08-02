import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guanare_market/src/controllers/products_controller.dart';

import 'package:guanare_market/src/theme/theme_light.dart';
import 'package:guanare_market/src/utils/get_assets.dart';

import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';
import 'package:guanare_market/src/widgets/Organisms/list_products_horizontal.dart';

class SellerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    final ProductsController productsController = Get.find();

    Widget _customImage(String imageURL, Size size) {
      return GestureDetector(
        onTap: () {
          Get.toNamed('/photo-view', arguments: imageURL);
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width,
                      child: _customImage(getImage('restaurant.jpg'), size)),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Restaurant Buenos Aires',
                          style: CustomTheme.lightTheme.textTheme.headline2,
                        ),
                        SizedBox(height: 8),
                        Text('Av. Unda - Calle 2',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contacto',
                          style: CustomTheme.lightTheme.textTheme.headline4,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Correo electrónico: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('juanbarrios045@gmail.com'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Télefono: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('+58412-1556808'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 12,
                  ),
                  ListProductsHorizontal(
                    title: 'Productos del vendedor',
                    products: productsController.products,
                    height: 300,
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
