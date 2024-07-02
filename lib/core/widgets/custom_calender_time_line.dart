import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomCalenderTimeLine extends StatelessWidget {
  const CustomCalenderTimeLine(
      {super.key, required this.initialDate, required this.onDateSelected});

  final DateTime initialDate;
  final Function(DateTime dateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      firstDate: DateTime(2023, 9, 1),
      lastDate: DateTime(2024, 9, 1),
      initialDate: initialDate,
      onDateSelected: (DateTime dateTime) => onDateSelected(dateTime),
      dayColor: Colors.blueGrey,
      activeDayColor: Colors.white,
      dotsColor: Colors.blue,
      activeBackgroundDayColor: kMainColor,
      leftMargin: MediaQuery.sizeOf(context).width * 0.4,
    );
  }
}
