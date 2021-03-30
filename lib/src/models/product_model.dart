import 'package:guanare_market/src/utils/format_amount.dart';
import 'package:guanare_market/src/utils/get_assets.dart';

class Product {
  const Product({required this.name, required this.image, required this.price});

  final String name, image;
  final double price;

  get priceFormated => formatAmount.format(price);
}

final products = <Product>[
  Product(name: 'iPhone X', image: getImage('phone.jpg'), price: 300.00),
  Product(
      name: 'Lenovo Ideapad 330s 8gb Ram 256gb SSD Ryzen 5',
      image: getImage('laptop.jpg'),
      price: 540.00),
  Product(
      name: 'Macbook Pro 2021 16gb Ram 512gb SSD i7',
      image: getImage('laptop2.jpg'),
      price: 1600.00),
  Product(name: 'iPhone 11 Pro', image: getImage('phone2.jpg'), price: 700.00),
  Product(name: 'Camisa', image: getImage('shirt.jpg'), price: 12.50),
];
