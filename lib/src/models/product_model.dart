import 'package:guanare_market/src/models/category_model.dart';
import 'package:guanare_market/src/utils/format_amount.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.seller,
    required this.category,
    this.isCart = false,
  });

  final String name, seller, id;
  final List<String> images;
  final double price;
  final Category category;
  bool isCart;

  get priceFormated => formatAmount.format(price);

  copyWith({
    String? id,
    String? name,
    List<String>? images,
    double? price,
    String? seller,
    Category? category,
    bool? isCart,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
      price: price ?? this.price,
      seller: seller ?? this.seller,
      category: category ?? this.category,
      isCart: isCart ?? this.isCart,
    );
  }
}
