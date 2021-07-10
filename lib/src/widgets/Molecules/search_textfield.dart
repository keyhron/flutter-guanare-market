import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:get/route_manager.dart';

// Pages
import 'package:guanare_market/src/pages/search_result.dart';

// Theme
import 'package:guanare_market/src/theme/theme_light.dart';

// Widgets
import 'package:guanare_market/src/widgets/Organisms/search_products.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onTap: () async {
        final List<SearchResult> history = [];

        final result = await showSearch(
            context: context, delegate: SearchProducts(history));

        if (!result!.isCancel && result.product != null) {
          Get.toNamed('product-details', arguments: result.product!.id);
        }
      },
      readOnly: true,
      prefix: Container(
          padding: EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset('assets/icons/search.svg',
              semanticsLabel: 'Search')),
      placeholder: 'Buscar',
      placeholderStyle: TextStyle(
          fontWeight: FontWeight.bold, color: CupertinoColors.placeholderText),
      cursorColor: palette.primary.main,
      cursorHeight: 22,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 13.0),
      style: CustomTheme.lightTheme.textTheme.bodyText2,
      decoration: BoxDecoration(
          color: palette.secondary.dark,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
