import 'package:flutter/material.dart';
import 'package:guanare_market/src/theme/theme_light.dart';
import 'package:guanare_market/src/widgets/Molecules/dots.dart';
import 'package:provider/provider.dart';

// Provider
import 'package:guanare_market/src/providers/slider_provider.dart';

// Data
import 'package:guanare_market/src/models/product_model.dart';

class ListProductsHorizontal extends StatefulWidget {
  @override
  _ListProductsHorizontalState createState() => _ListProductsHorizontalState();
}

class _ListProductsHorizontalState extends State<ListProductsHorizontal> {
  int currentDot = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Provider(
      create: (_) => SliderProvider(),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Novedades de hoy',
                    style: themeLight.textTheme.headline4,
                  ),
                  Dots(products.length, currentDot)
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: PageView.builder(
                  onPageChanged: (i) {
                    setState(() {
                      currentDot = i;
                    });
                  },
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                        width: size.width,
                        child: Stack(
                          children: [
                            Image.asset(
                              products[i].image,
                              fit: BoxFit.cover,
                              width: size.width,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 120,
                                width: size.width,
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[i].name,
                                      style: themeLight.textTheme.headline6,
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: palette.secondary['dark']!
                                      .withOpacity(0.9),
                                ),
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
