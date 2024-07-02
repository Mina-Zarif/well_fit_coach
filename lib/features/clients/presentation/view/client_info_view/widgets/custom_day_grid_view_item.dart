import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomDayGridViewItem extends StatelessWidget {
  const CustomDayGridViewItem(
      {super.key, required this.day, required this.active});

  final String day;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: (active ? kMainColor : Colors.white),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xffe4e4e4),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: (active ? Colors.white : Colors.black),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
