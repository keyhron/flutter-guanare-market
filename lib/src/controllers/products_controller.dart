import 'package:get/get.dart';

import 'package:guanare_market/src/models/category_model.dart';
import 'package:guanare_market/src/models/product_model.dart';

import 'package:guanare_market/src/utils/get_assets.dart';

class ProductsController extends GetxController {
  var products = <Product>[].obs;

  Product? findProduct(String id) {
    final filterProduct = products.where((p) => p.id == id);

    if (filterProduct.length > 0) return filterProduct.first;

    return null;
  }

  bool existProduct(String id) {
    return products.where((p) => p.id == id).length > 0;
  }

  initProducts() {
    products.value = [
      Product(
          id: '1',
          name: 'iPhone X',
          images: [getImage('phone.jpg'), getImage('phone2.jpg')],
          price: 300.00,
          category: categories.where((e) => e.realName == 'phones').first,
          seller: 'Juan Barrios'),
      Product(
          id: '2',
          name: 'Lenovo Ideapad 330s 8gb Ram 256gb SSD Ryzen 5',
          images: [getImage('laptop.jpg'), getImage('laptop2.jpg')],
          price: 540.00,
          category: categories.where((e) => e.realName == 'electronics').first,
          seller: 'Carlos Barrios'),
      Product(
          id: '3',
          name: 'Macbook Pro 2021 16gb Ram 512gb SSD i7',
          images: [getImage('laptop2.jpg'), getImage('laptop.jpg')],
          price: 1600.00,
          category: categories.where((e) => e.realName == 'electronics').first,
          seller: 'Juan Barrios'),
      Product(
          id: '4',
          name: 'iPhone 11 Pro',
          images: [getImage('phone2.jpg'), getImage('phone.jpg')],
          price: 700.00,
          category: categories.where((e) => e.realName == 'phones').first,
          seller: 'Carlos Barrios'),
      Product(
          id: '5',
          name: 'Camisa',
          images: [getImage('shirt.jpg')],
          price: 12.50,
          category: categories.where((e) => e.realName == 'clothes').first,
          seller: 'Juan Barrios'),
    ];
    Get.toNamed('home');
  }

  updateProduct(
      {required String id,
      String? name,
      List<String>? images,
      double? price,
      String? seller,
      Category? category,
      bool? isCart}) {
    // Update new product
    final productToUpdate = findProduct(id);

    if (productToUpdate == null) {
      Get.snackbar('Producto no encontrado', 'No se encontró el producto');
    }

    final newProduct = productToUpdate?.copyWith(
        id: id,
        name: name,
        images: images,
        price: price,
        seller: seller,
        category: category,
        isCart: isCart);

    // Clean old product
    final newCartProducts = products.where((p) => p.id != id).toList();

    final index = products.indexOf(productToUpdate);
    newCartProducts.insert(index, newProduct);

    // Set product
    products.value = newCartProducts;
  }

  deleteProduct(String id) {
    products.value = products.where((p) => p.id != id).toList();
  }
}
