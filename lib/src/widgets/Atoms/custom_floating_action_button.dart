import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final double size;
  final Color color;
  final Widget child;
  final void Function() onPressed;

  CustomFloatingActionButton({
    this.size = 75.0,
    this.color = const Color(0xff2E2C2D),
    required this.child,
    required this.onPressed,
  });

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
        backgroundColor: this.color,
        child: this.child,
        onPressed: this.onPressed,
      ),
    );
  }
}
