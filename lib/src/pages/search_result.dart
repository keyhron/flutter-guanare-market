import 'package:guanare_market/src/models/product_model.dart';

class SearchResult {
  final bool isCancel;
  final Product? product;

  SearchResult({
    required this.isCancel,
    this.product,
  });
}
