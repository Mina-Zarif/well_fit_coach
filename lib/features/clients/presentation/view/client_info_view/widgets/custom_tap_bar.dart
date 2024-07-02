// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({super.key, required this.onTap, required this.index});

  final Function(int index) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        onTap: (value) => onTap(value),
        indicatorColor: kMainColor,
        overlayColor: const MaterialStatePropertyAll(kSplashColor),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
        tabs: [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AssetsApp.currentIcon,
                  color: (index == 0) ? kMainColor : const Color(0xff61676B),
                ),
                Text(
                  "Current",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: (index == 0) ? kMainColor : const Color(0xff61676B),
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AssetsApp.timerIcon,
                  color: (index == 1) ? kMainColor : const Color(0xff61676B),
                ),
                Text(
                  "History",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: (index == 1) ? kMainColor : const Color(0xff61676B),
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AssetsApp.biometricsIcon,
                  color: (index == 2) ? kMainColor : const Color(0xff61676B),
                ),
                Text(
                  "Biometrics",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: (index == 2) ? kMainColor : const Color(0xff61676B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
