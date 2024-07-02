import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';

class CustomCircularChart extends StatelessWidget {
  const CustomCircularChart({
    super.key,
    required this.color,
    required this.average,
    required this.child,
    this.size = const Size(300.0, 300.0),
    this.text,
  });

  final Color color;
  final double average;
  final Widget child;
  final Size size;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCircularChart(
              size: size,
              initialChartData: [
                CircularStackEntry(
                  [
                    CircularSegmentEntry(
                      average,
                      color,
                      rankKey: 'steps',
                    ),
                    CircularSegmentEntry(
                      100 - average,
                      const Color(0xfff2f4f8),
                    ),
                  ],
                ),
              ],
              chartType: CircularChartType.Radial,
              edgeStyle: SegmentEdgeStyle.round,
              percentageValues: true,
            ),
            child,
          ],
        ),
        text != null
            ? Text(
                text!,
                style: const TextStyle(fontSize: 15),
              )
            : const SizedBox()
      ],
    );
  }
}
