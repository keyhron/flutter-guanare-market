class Product {
  const Product({required this.name, required this.image, required this.price});

  final String name, image;
  final double price;

  get priceToString => price.toStringAsFixed(2);
}

final products = const <Product>[
  Product(name: 'iPhone X', image: 'assets/images/phone.jpg', price: 300.00),
  Product(
      name: 'Lenovo Ideapad 330s',
      image: 'assets/images/laptop.jpg',
      price: 540.00),
  Product(
      name: 'Macbook Pro 2021',
      image: 'assets/images/laptop2.jpg',
      price: 1600.00),
  Product(
      name: 'iPhone 11 Pro', image: 'assets/images/phone2.jpg', price: 700.00),
  Product(name: 'Camisa', image: 'assets/images/shirt.jpg', price: 12.50),
];
