import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomCardInfo extends StatelessWidget {
  const CustomCardInfo({
    super.key,
    required this.label,
    required this.value,
    required this.width,
    required this.height,
    this.icon,
    this.centerLabel = false,
    this.backgroundColor = kMainColor,
  });

  final String label, value;
  final double width, height;
  final Widget? icon;
  final bool centerLabel;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          (centerLabel) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.quicksand(
            fontSize: 14.75,
            fontWeight: FontWeight.w600,
            height: 1.6,
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                if (icon != null) icon!,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
