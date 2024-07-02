import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';

class CustomWaterOval extends StatelessWidget {
  const CustomWaterOval({super.key, required this.barWidth});

  final int barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: barWidth - 50,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AssetsApp.ovalIcon),
            Column(
              children: [
                Text(
                  barWidth.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
