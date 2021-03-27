import 'package:flutter/material.dart';
import 'package:guanare_market/src/models/category_model.dart';
import 'package:guanare_market/src/theme/theme_light.dart';

class CardCategory extends StatelessWidget {
  final Category category;

  CardCategory(this.category);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double widthCard = size.width * 0.67;
    final double heightCard = size.height * 0.12;

    return Container(
      width: widthCard,
      height: heightCard,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                category.image,
                fit: BoxFit.cover,
                width: widthCard,
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: widthCard,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.67),
                    Colors.transparent
                  ]),
                ),
              )),
          Container(
            width: widthCard,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              category.name,
              style: CustomTheme.lightTheme.textTheme.headline1!.copyWith(
                  color: palette.secondary['ultraDark'],
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
