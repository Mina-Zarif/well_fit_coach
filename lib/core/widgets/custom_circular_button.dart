import 'package:flutter/material.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.radius = 26});

  final Widget child;
  final Function() onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        padding: const EdgeInsetsDirectional.all(3.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xffe1e1e4),
            width: 1.8,
          ),
        ),
        child: child,
      ),
    );
  }
}
