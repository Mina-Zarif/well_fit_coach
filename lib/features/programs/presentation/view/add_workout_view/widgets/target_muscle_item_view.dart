import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';

class TargetMuscleItemView extends StatelessWidget {
  const TargetMuscleItemView(
      {super.key,
      required this.onItemTap,
      required this.backgroundColor,
      required this.title});

  final Function() onItemTap;
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      highlightColor: kSplashColor,
      splashColor: kSplashColor,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor,
            child: SvgPicture.asset(AssetsApp.bicepIcon),
          ),
          const SizedBox(width: 25),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}
