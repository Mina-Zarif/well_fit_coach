import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/functions/custom_line_chart.dart';
import 'package:well_fit_coach/features/clients/presentation/view/calories_info_view/widgets/custom_line_chart.dart';
import 'package:well_fit_coach/features/clients/presentation/view/weight_info_view/widgets/weight_journal_item_view.dart';

class CustomWeightDetailsView extends StatelessWidget {
  const CustomWeightDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kHorizontal, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "My progress",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xff2D3142)),
            ),
            CustomLineChart(
              backgroundColor: Colors.transparent,
              drawVerticalLine: false,
              drawHorizontalLine: true,
              showTitlesData: true,
              maxX: 6,
              maxY: 6,
              lineBarsData: [
                customLineChartBarData(
                  lineColor: Colors.red,
                  maxY: 6,
                  spots: [
                    const FlSpot(0, 4),
                    const FlSpot(1, 3),
                    const FlSpot(2, 2.4),
                    const FlSpot(3, 3.2),
                    const FlSpot(4, 4.5),
                    const FlSpot(5, 3),
                    const FlSpot(6, 4),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Journal",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const WeightJournalItemView(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
