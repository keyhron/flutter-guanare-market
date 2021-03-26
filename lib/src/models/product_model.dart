class Product {
  const Product(
    this.name,
    this.image,
  );

  final String name;
  final String image;
}

final products = const <Product>[
  Product('iPhone X', 'assets/images/phone.jpg'),
  Product('Lenovo Ideapad 330s', 'assets/images/laptop.jpg'),
  Product('Macbook Pro 2021', 'assets/images/laptop2.jpg'),
  Product('iPhone 11 Pro', 'assets/images/phone2.jpg'),
  Product('Camisa', 'assets/images/shirt.jpg'),
];
