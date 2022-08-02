import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

// Pages
import 'package:guanare_market/src/pages/search_result.dart';

// Theme
import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/widgets/Atoms/custom_floating_action_button.dart';

// Widget
import 'package:guanare_market/src/widgets/Organisms/search_products.dart';

class FloatingActionButtonSearch extends StatelessWidget {
  final double size;
  FloatingActionButtonSearch({this.size = 65.0});

  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      heroTag: 'fba-search',
      size: this.size,
      child: SvgPicture.asset('assets/icons/search.svg',
          color: palette.secondary.main, semanticsLabel: 'Search'),
      onPressed: () async {
        final List<SearchResult> history = [];

        final result = await showSearch(
            context: context, delegate: SearchProducts(history));

        if (!result!.isCancel && result.product != null) {
          Get.toNamed('/product-details', arguments: result.product!.id);
        }
      },
    );
  }
}
