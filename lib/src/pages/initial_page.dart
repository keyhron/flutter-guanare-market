import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Page
import 'package:guanare_market/src/pages/home_page.dart';
import 'package:guanare_market/src/pages/cart_page.dart';

// Provider
import 'package:guanare_market/src/providers/bottom_navigation_provider.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context);

    return (bottomNavigationProvider.currentPage == 0)
        ? HomePage()
        : CartPage();
  }
}
