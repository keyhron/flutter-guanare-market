import 'package:flutter/material.dart';
import 'package:guanare_market/src/models/category_model.dart';
import 'package:guanare_market/src/theme/theme_light.dart';
import 'package:guanare_market/src/widgets/Molecules/card_category.dart';
import 'package:guanare_market/src/widgets/Molecules/dots.dart';

class ListCategoriesHorizontal extends StatefulWidget {
  final double height;
  final String title;
  final List<Category> categories;

  ListCategoriesHorizontal({
    required this.height,
    required this.title,
    required this.categories,
  });

  @override
  _ListCategoriesHorizontalState createState() =>
      _ListCategoriesHorizontalState();
}

class _ListCategoriesHorizontalState extends State<ListCategoriesHorizontal> {
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
                Dots(widget.categories.length, currentDot)
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: widget.height,
            child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.73,
                  initialPage: 0,
                ),
                onPageChanged: (i) {
                  setState(() {
                    currentDot = i;
                  });
                },
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.categories.length,
                itemBuilder: (BuildContext context, int i) {
                  return CardCategory(widget.categories[i]);
                }),
          ),
        ],
      ),
    );
  }
}
