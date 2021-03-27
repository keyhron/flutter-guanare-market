class Category {
  const Category({required this.name, required this.image});

  final String name, image;
}

final categories = const <Category>[
  Category(
    name: 'Ropa',
    image: 'assets/images/shirt2.jpg',
  ),
  Category(
    name: 'Vehículos',
    image: 'assets/images/car2.jpg',
  ),
  Category(
    name: 'Electrónica',
    image: 'assets/images/laptop.jpg',
  ),
  Category(
    name: 'Télefonos',
    image: 'assets/images/phone.jpg',
  ),
  Category(
    name: 'Comida',
    image: 'assets/images/restaurant.jpg',
  ),
];
