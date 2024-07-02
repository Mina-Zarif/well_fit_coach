// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';

class CustomSwitchButton extends StatelessWidget {
  const CustomSwitchButton({
    super.key,
    required this.onTap,
    required this.isWorkoutActive,
  });

  final Function() onTap;
  final bool isWorkoutActive;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Card(
            surfaceTintColor: Colors.white,
            elevation: 3.5,
            child: Container(
              width: width,
              height: 35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsApp.workoutIcon,
                    color: kMainColor,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Workout",
                    style: TextStyle(
                      color: kMainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AssetsApp.nutrition,
                    color: kMainColor,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Nutrition",
                    style: TextStyle(
                      color: kMainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedAlign(
          alignment:
              (isWorkoutActive) ? Alignment.centerLeft : Alignment.centerRight,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linear,
          child: Container(
            width: width * 0.5,
            height: 35,
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: (isWorkoutActive)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetsApp.workoutIcon,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Workout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetsApp.nutrition,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Nutrition",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
