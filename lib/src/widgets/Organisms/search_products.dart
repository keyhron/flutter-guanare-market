import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guanare_market/src/models/product_model.dart';
import 'package:guanare_market/src/pages/search_result.dart';
import 'package:guanare_market/src/theme/palette.dart';
import 'package:guanare_market/src/utils/get_assets.dart';

class SearchProducts extends SearchDelegate<SearchResult> {
  @override
  final String searchFieldLabel;
  final List<SearchResult> history;
  final palette = Palette();

  SearchProducts(this.history) : this.searchFieldLabel = 'Buscar...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: SvgPicture.asset(getIcon('x')),
          onPressed: () => this.query = '')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: SvgPicture.asset(getIcon('chevron-left')),
        onPressed: () => this.close(context, SearchResult(isCancel: true)));
  }

  @override
  Widget buildResults(BuildContext context) {
    return this._buildResultsSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (this.query.length == 0) {
      return ListView(
        children: [
          ...this
              .history
              .map((result) => ListTile(
                    leading: SvgPicture.asset(
                      result.product!.category.icon,
                      color: palette.primary['main'],
                    ),
                    title: Text(result.product!.name),
                    // subtitle: Text( result.product!.seller ),
                    onTap: () {
                      this.close(context, result);
                    },
                  ))
              .toList()
        ],
      );
    }

    return this._buildResultsSuggestions(context);
  }

  Widget _buildResultsSuggestions(BuildContext context) {
    if (this.query.length == 0) {
      return Container();
    }

    final productsFilter = products
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (productsFilter.length == 0) {
      return ListTile(
        title: Text('No hay resultados con $query'),
      );
    }

    return ListView.separated(
      itemCount: productsFilter.length,
      separatorBuilder: (_, i) => Divider(),
      itemBuilder: (_, i) {
        final Product product = productsFilter[i];

        return ListTile(
          leading: SvgPicture.asset(
            product.category.icon,
            color: palette.primary['main'],
          ),
          title: Text(product.name),
          // subtitle: Text(product.seller),
          onTap: () {
            this.close(
                context, SearchResult(isCancel: false, product: product));
          },
        );
      },
    );
  }
}
