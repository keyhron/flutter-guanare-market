import 'package:guanare_market/src/utils/get_assets.dart'
    show getIcon, getImage;

class Category {
  const Category(
      {required this.name,
      required this.image,
      required this.icon,
      required this.realName});

  final String name, image, icon, realName;
}

final categories = <Category>[
  Category(
      realName: 'clothes',
      name: 'Ropa',
      image: getImage('shirt2.jpg'),
      icon: getIcon('checkroom')),
  Category(
      realName: 'vehicles',
      name: 'Vehículos',
      image: getImage('car2.jpg'),
      icon: getIcon('car')),
  Category(
      realName: 'electronics',
      name: 'Electrónica',
      image: getImage('laptop.jpg'),
      icon: getIcon('computer')),
  Category(
      realName: 'phones',
      name: 'Télefonos',
      image: getImage('phone.jpg'),
      icon: getIcon('smartphone')),
  Category(
      realName: 'food',
      name: 'Comida',
      image: getImage('restaurant.jpg'),
      icon: getIcon('restaurant')),
];
