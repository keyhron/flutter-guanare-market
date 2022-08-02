import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guanare_market/src/controllers/products_controller.dart';
import 'package:guanare_market/src/utils/get_assets.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ProductsController productsController = Get.find();
      productsController.initProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(getImage('guanare-market-logo.png')),
      ),
    );
  }
}
