import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';

class CustomWeightAppBar extends StatelessWidget {
  const CustomWeightAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomRichText(
            text: "CURRENT\n",
            textAlign: TextAlign.center,
            initTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xff755496),
              height: 1.8,
            ),
            children: [
              TextSpan(
                  text: "90 ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  )),
              TextSpan(
                text: "Kg",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            AssetsApp.weightIcon,
            height: 40,
            width: 40,
          ),
          const CustomRichText(
            text: "TARGET\n",
            textAlign: TextAlign.center,
            initTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xff755496),
              height: 1.8,
            ),
            children: [
              TextSpan(
                  text: "88 ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  )),
              TextSpan(
                text: "Kg",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
