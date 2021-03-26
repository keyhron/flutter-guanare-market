import 'package:flutter/material.dart';
import 'package:guanare_market/src/theme/palette.dart';

class Dots extends StatelessWidget {
  final int count, current;

  Dots(this.count, this.current);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.count, (i) => _Dot(i, current)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index, current;

  _Dot(this.index, this.current);

  @override
  Widget build(BuildContext context) {
    final palette = Palette();
    final Color? color = current == index
        ? palette.primary['main']
        : palette.secondary['ultraDark'];

    final size = current == index ? 10.0 : 8.0;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
