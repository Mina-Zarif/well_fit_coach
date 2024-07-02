import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';

class CustomBiometricsInfoItemView extends StatelessWidget {
  const CustomBiometricsInfoItemView({
    super.key,
    required this.title,
    required this.svgImagePath,
    required this.value,
    required this.unit,
    required this.lastUpdate,
    required this.titleColor,
    required this.onTap,
  });

  final String title, svgImagePath, value, lastUpdate, unit;
  final Color titleColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.2),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.rubik(
                fontSize: 13,
                letterSpacing: 1.1,
                fontWeight: FontWeight.w500,
                color: titleColor,
              ),
            ),
            const Spacer(),
            Center(child: SvgPicture.asset(svgImagePath)),
            const Spacer(),
            CustomRichText(
              text: value,
              initTextStyle:
                  GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 20),
              children: [
                TextSpan(
                  text: " $unit",
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Text(
              "last update $lastUpdate",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff6a6d79),
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
