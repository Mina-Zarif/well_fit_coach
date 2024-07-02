import 'package:flutter/material.dart';

class CustomWaterIconStyle extends StatelessWidget {
  const CustomWaterIconStyle(
      {super.key,
      required this.width,
      required this.height,
      required this.child,
      required this.backgroundColor,
      this.radius = 10,
      required this.onTap});

  final double width, height, radius;
  final Widget child;
  final Color backgroundColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: radius,
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
