import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final double size;

  CustomFloatingActionButton({
    required this.child,
    required this.onPressed,
    required this.size,
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
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
