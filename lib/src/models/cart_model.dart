import 'package:guanare_market/src/models/product_model.dart';
import 'package:guanare_market/src/utils/format_amount.dart';

class Cart {
  Cart({required this.product, this.count = 1});

  final Product product;
  int count;

  double get price =>
      double.parse(formatAmount.format((count * this.product.price)));
}
