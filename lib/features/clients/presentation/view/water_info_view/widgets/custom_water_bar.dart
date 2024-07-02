import 'package:flutter/material.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';

class CustomWaterBar extends StatelessWidget {
  const CustomWaterBar({super.key, required this.barWidth});

  final int barWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xff5DD3E2),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 60,
          width: barWidth.toDouble(),
          decoration: BoxDecoration(
            color: const Color(0xff7FE3F0),
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(
              image: AssetImage(AssetsApp.waterBarBackground),
            ),
          ),
        ),
      ],
    );
  }
}
