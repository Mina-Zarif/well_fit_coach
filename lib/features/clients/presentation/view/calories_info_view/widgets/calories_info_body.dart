import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:well_fit_coach/core/functions/custom_line_chart.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/features/clients/presentation/view/calories_info_view/widgets/custom_data_list_view.dart';
import 'package:well_fit_coach/features/clients/presentation/view/calories_info_view/widgets/custom_line_chart.dart';
import 'package:well_fit_coach/features/clients/presentation/view/calories_info_view/widgets/graph_data.dart';

class CaloriesInfoBody extends StatelessWidget {
  const CaloriesInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          leading: const Icon(Icons.arrow_back_ios),
          leadingOnTap: () => AppRouter.router.pop(),
        ),
        const Text(
          "DAILY INTAKE",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xffE02EA4),
          ),
        ),
        const SizedBox(height: 5),
        const CustomRichText(
          text: "Today have\nconsumed ",
          children: [
            TextSpan(
              text: "500 cal",
              style: TextStyle(
                color: Color(0xffFF592C),
              ),
            )
          ],
          initTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        CustomLineChart(
          maxY: 6,
          maxX: 6,
          lineBarsData: [
            customLineChartBarData(
              lineColor: Colors.red,
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 1),
                const FlSpot(2, 2),
                const FlSpot(3, 2),
                const FlSpot(4, 1.5),
                const FlSpot(6, 4),
              ],
              maxY: 6,
            ),
            customLineChartBarData(
              lineColor: Colors.orange,
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 1),
                const FlSpot(2, 3),
                const FlSpot(3, 1.2),
                const FlSpot(4, 3.2),
                const FlSpot(6, 2),
              ],
              maxY: 6,
            ),
            customLineChartBarData(
              lineColor: Colors.green,
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 1),
                const FlSpot(2, 2.5),
                const FlSpot(3, 3),
                const FlSpot(4, 4.2),
                const FlSpot(6, 3),
              ],
              maxY: 6,
            ),
            customLineChartBarData(
              lineColor: Colors.purple,
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 1),
                const FlSpot(2, 4),
                const FlSpot(3, 2),
                const FlSpot(4, 5.2),
                const FlSpot(6, 1),
              ],
              maxY: 6,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const GraphData(),
        const SizedBox(height: 20),
        const Expanded(child: CustomDataListView()),
      ],
    );
  }
}
