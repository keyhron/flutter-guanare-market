import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:guanare_market/src/theme/theme_light.dart';
import 'package:guanare_market/src/widgets/Molecules/card_product.dart';
import 'package:guanare_market/src/widgets/Molecules/dots.dart';

// Data
import 'package:guanare_market/src/models/product_model.dart';

class ListProductsHorizontal extends StatefulWidget {
  final double height;
  final String title;
  final List<Product> products;

  ListProductsHorizontal({
    required this.height,
    required this.title,
    required this.products,
  });

  @override
  _ListProductsHorizontalState createState() => _ListProductsHorizontalState();
}

class _ListProductsHorizontalState extends State<ListProductsHorizontal> {
  int currentDot = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: CustomTheme.lightTheme.textTheme.headline4,
                ),
                Dots(widget.products.length, currentDot)
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: widget.height,
            child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.66,
                  initialPage: 0,
                ),
                onPageChanged: (i) {
                  setState(() {
                    currentDot = i;
                  });
                },
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.products.length,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                      onTap: () {
                        Get.toNamed('product-details',
                            arguments: widget.products[i]);
                      },
                      child: CardProduct(widget.products[i]));
                }),
          ),
        ],
      ),
    );
  }
}
