import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/features/clients/presentation/view/steps_info_view/widgets/day_graph_item_view.dart';

class CustomDailyGraph extends StatelessWidget {
  const CustomDailyGraph({super.key, required this.data});

  final List<double> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffFFF1ED),
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(20),
            topStart: Radius.circular(20),
          ),
        ),
        padding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: kHorizontal),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DayGraphItemView(
              average: data[0],
              day: "Mon",
            ),
            DayGraphItemView(
              average: data[1],
              day: "Tue",
            ),
            DayGraphItemView(
              average: data[2],
              day: "Wed",
            ),
            DayGraphItemView(
              average: data[3],
              day: "Thu",
            ),
            DayGraphItemView(
              average: data[4],
              day: "Fri",
            ),
            DayGraphItemView(
              average: data[5],
              day: "Sat",
            ),
            DayGraphItemView(
              average: data[6],
              day: "Sun",
            )
          ],
        ),
      ),
    );
  }
}
