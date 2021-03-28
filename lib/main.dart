import 'package:flutter/material.dart';
import 'package:guanare_market/src/pages/cart_page.dart';

// Pages
import 'package:guanare_market/src/pages/home_page.dart';
import 'package:guanare_market/src/pages/initial_page.dart';

// Provider
import 'package:guanare_market/src/providers/bottom_navigation_provider.dart';

// Theme Light
import 'package:guanare_market/src/theme/theme_light.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavigationProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightTheme,
          title: 'Guanare Market',
          initialRoute: 'home',
          routes: {
            'home': (_) => InitialPage(),
          }),
    );
  }
}
