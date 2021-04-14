import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:guanare_market/src/models/product_model.dart';

import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CustomAppBar(isBack: true),
            Text(product.name),
            Hero(tag: product.image, child: Image.asset(product.image)),
          ],
        ),
      ),
    );
  }
}
