import 'package:flutter/material.dart' show Color, Colors, ChangeNotifier;

class SliderProvider with ChangeNotifier {
  int _currentPage = 0;
  Color _colorPrimary = Colors.blue;
  Color _colorSecundary = Colors.grey;
  double _dotSelectedSize = 12.0;
  double _dotUnselectedSize = 12.0;

  int get currentPage => this._currentPage;

  set currentPage(int currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimary => this._colorPrimary;

  set colorPrimary(Color colorPrimary) {
    this._colorPrimary = colorPrimary;
  }

  Color get colorSecundary => this._colorSecundary;

  set colorSecundary(Color colorSecundary) {
    this._colorSecundary = colorSecundary;
  }

  double get dotSelectedSize => this._dotSelectedSize;

  set dotSelectedSize(double dotSelectedSize) {
    this._dotSelectedSize = dotSelectedSize;
  }

  double get dotUnselectedSize => this._dotUnselectedSize;

  set dotUnselectedSize(double dotUnselectedSize) {
    this._dotUnselectedSize = dotUnselectedSize;
  }
}
