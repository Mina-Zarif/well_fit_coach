import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomAddWorkOrNutrition extends StatelessWidget {
  const CustomAddWorkOrNutrition(
      {super.key, required this.onTap, required this.title});

  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kSplashColor,
      highlightColor: kSplashColor,
      onTap: onTap,
      child: Row(
        children: [
          const Icon(
            Icons.add,
            size: 30,
            color: Color(0xff7F7F7F),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xff7F7F7F),
            ),
          ),
        ],
      ),
    );
  }
}
