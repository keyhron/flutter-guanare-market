import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

// Pages
import 'package:guanare_market/src/pages/search_result.dart';

// Theme
import 'package:guanare_market/src/theme/palette.dart';

// Widget
import 'package:guanare_market/src/widgets/Organisms/search_products.dart';

class FloatingActionButtonSearch extends StatelessWidget {
  final double size;

  FloatingActionButtonSearch({this.size = 80.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: Colors.black12,
            spreadRadius: 2,
            offset: Offset(0.0, 0.0))
      ]),
      child: FloatingActionButton(
        child: SvgPicture.asset('assets/icons/search.svg',
            color: Palette().secondary['main'], semanticsLabel: 'Search'),
        onPressed: () async {
          final List<SearchResult> history = [];

          final result = await showSearch(
              context: context, delegate: SearchProducts(history));

          if (!result!.isCancel && result.product != null) {
            Get.toNamed('product-details', arguments: result.product);
          }
        },
      ),
    );
  }
}
