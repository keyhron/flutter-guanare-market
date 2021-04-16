import 'package:guanare_market/src/models/category_model.dart';
import 'package:guanare_market/src/utils/format_amount.dart';
import 'package:guanare_market/src/utils/get_assets.dart';

class Product {
  const Product({
    required this.name,
    required this.images,
    required this.price,
    required this.seller,
    required this.category,
  });

  final String name, seller;
  final List<String> images;
  final double price;
  final Category category;

  get priceFormated => formatAmount.format(price);
}

final products = <Product>[
  Product(
      name: 'iPhone X',
      images: [getImage('phone.jpg'), getImage('phone2.jpg')],
      price: 300.00,
      category: categories.where((e) => e.realName == 'phones').first,
      seller: 'Juan Barrios'),
  Product(
      name: 'Lenovo Ideapad 330s 8gb Ram 256gb SSD Ryzen 5',
      images: [getImage('laptop.jpg'), getImage('laptop2.jpg')],
      price: 540.00,
      category: categories.where((e) => e.realName == 'electronics').first,
      seller: 'Carlos Barrios'),
  Product(
      name: 'Macbook Pro 2021 16gb Ram 512gb SSD i7',
      images: [getImage('laptop2.jpg'), getImage('laptop.jpg')],
      price: 1600.00,
      category: categories.where((e) => e.realName == 'electronics').first,
      seller: 'Juan Barrios'),
  Product(
      name: 'iPhone 11 Pro',
      images: [getImage('phone2.jpg'), getImage('phone.jpg')],
      price: 700.00,
      category: categories.where((e) => e.realName == 'phones').first,
      seller: 'Carlos Barrios'),
  Product(
      name: 'Camisa',
      images: [getImage('shirt.jpg')],
      price: 12.50,
      category: categories.where((e) => e.realName == 'clothes').first,
      seller: 'Juan Barrios'),
];
