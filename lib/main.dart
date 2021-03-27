import 'package:flutter/material.dart';

// Pages
import 'package:guanare_market/src/pages/home_page.dart';

// Theme Light
import 'package:guanare_market/src/theme/theme_light.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        title: 'Guanare Market',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage()});
  }
}
