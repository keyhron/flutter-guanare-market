import 'package:guanare_market/src/utils/get_assets.dart' show getImage;

class Category {
  const Category({required this.name, required this.image});

  final String name, image;
}

final categories = <Category>[
  Category(
    name: 'Ropa',
    image: getImage('shirt2.jpg'),
  ),
  Category(
    name: 'Vehículos',
    image: getImage('car2.jpg'),
  ),
  Category(
    name: 'Electrónica',
    image: getImage('laptop.jpg'),
  ),
  Category(
    name: 'Télefonos',
    image: getImage('phone.jpg'),
  ),
  Category(
    name: 'Comida',
    image: getImage('restaurant.jpg'),
  ),
];
