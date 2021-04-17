import 'package:flutter/material.dart' show Colors;
import 'package:get/get.dart';
import 'package:guanare_market/src/controllers/products_controller.dart';
import 'package:guanare_market/src/models/cart_model.dart';
import 'package:guanare_market/src/models/product_model.dart';

class CartController extends GetxController {
  var cartProducts = <Cart>[].obs;

  newProduct(Product product) {
    final ProductsController productsController = Get.find();
    final newCartProduct = Cart(product: product);

    final verifyCartProducts =
        cartProducts.where((c) => c.product.id == product.id).toList();

    if (verifyCartProducts.length > 0) {
      Get.snackbar(
          'Producto en carrito', 'El producto ya se encuentra en el carrito',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return;
    }

    cartProducts.value = [...cartProducts, newCartProduct];

    productsController.updateProduct(id: product.id, isCart: true);

    Get.snackbar('Producto agregado', 'Se ha agregado el producto al carrito',
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
  }

  updateProductCount({required String id, required int value}) {
    if (value < 1) return;

    // Update new product
    final cartProductToUpdate =
        cartProducts.where((c) => c.product.id == id).toList();

    if (cartProductToUpdate.length < 1) return;

    cartProductToUpdate.first.count = value;

    // Clean old product
    final newCartProducts =
        cartProducts.where((c) => c.product.id != id).toList();

    final index = cartProducts.indexOf(cartProductToUpdate.first);
    newCartProducts.insert(index, cartProductToUpdate.first);

    // Set product
    cartProducts.value = newCartProducts;
  }

  deleteProduct(String id) {
    final ProductsController productsController = Get.find();
    productsController.updateProduct(id: id, isCart: false);

    Get.snackbar('Producto removido', 'Se ha removido el producto del carrito',
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);

    cartProducts.value = cartProducts.where((c) => c.product.id != id).toList();
  }

  String productsPrices() {
    double productsPrices = 0.00;

    cartProducts.forEach((c) {
      productsPrices += c.product.price;
    });

    return productsPrices.toStringAsFixed(2);
  }

  int productsCount() {
    int productsCount = 0;

    cartProducts.forEach((c) {
      productsCount += c.count;
    });

    return productsCount;
  }

  String total() {
    double total = 0.00;

    cartProducts.forEach((c) {
      total += c.price;
    });

    return total.toStringAsFixed(2);
  }
}
