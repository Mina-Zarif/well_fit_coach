import 'dart:math';

import 'package:flutter/material.dart';

import '../../contestants.dart';

class CustomLinerStepper extends StatelessWidget {
  const CustomLinerStepper({
    super.key,
    this.width = 120,
    this.backgroundColor = const Color(0xffD8D8D8),
    this.activeColor = kMainColor,
    required this.totalSteps,
    required this.step,
  });

  final double width, totalSteps, step;
  final Color backgroundColor, activeColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 8,
          width: width * min((step / totalSteps), 1),
          decoration: BoxDecoration(
            color: activeColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
