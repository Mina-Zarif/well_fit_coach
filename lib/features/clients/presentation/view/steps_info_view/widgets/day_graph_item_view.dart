import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:well_fit_coach/contestants.dart';

class DayGraphItemView extends StatelessWidget {
  const DayGraphItemView(
      {super.key, required this.day, required this.average, this.total = 150});

  final String day;
  final double average, total;

  @override
  Widget build(BuildContext context) {
    final bool isToday =
        day == DateFormat('EEEE').format(DateTime.now()).substring(0, 3);

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 10,
              height: total,
              decoration: BoxDecoration(
                color: const Color(0xffeaeaea),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 10,
              height: average * total / 100,
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: (isToday) ? Colors.orange : Colors.transparent,
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            day,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
