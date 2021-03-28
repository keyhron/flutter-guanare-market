import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  CustomFloatingActionButton({
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      margin: EdgeInsets.only(bottom: 3),
      child: FloatingActionButton(
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
