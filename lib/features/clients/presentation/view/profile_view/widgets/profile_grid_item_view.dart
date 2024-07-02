import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/contestants.dart';

class ProfileGridItemView extends StatelessWidget {
  const ProfileGridItemView({
    super.key,
    required this.title,
    required this.onItemTap,
    required this.assetIcon,
  });

  final String title, assetIcon;
  final Function() onItemTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      splashColor: kSplashColor,
      highlightColor: kSplashColor,
      child: Column(
        children: [
          SvgPicture.asset(
            assetIcon,
            width: 30,
            height: 30,
            // ignore: deprecated_member_use
            color: kMainColor,
          ),
          const SizedBox(height: 7.4),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
