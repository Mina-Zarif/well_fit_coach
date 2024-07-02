import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({
    super.key,
    required this.lineBarsData,
    required this.maxY,
    required this.maxX,
    this.minY = 0,
    this.minX = 0,
    this.drawVerticalLine = true,
    this.drawHorizontalLine = false,
    this.showTitlesData = false,
    this.backgroundColor = const Color(0xffFFF8F6),
  });

  final List<LineChartBarData> lineBarsData;
  final double maxY, maxX, minY, minX;
  final bool drawVerticalLine, drawHorizontalLine, showTitlesData;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          backgroundColor: backgroundColor,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: drawVerticalLine,
            drawHorizontalLine: drawHorizontalLine,
            getDrawingHorizontalLine: (value) => const FlLine(
              color: Color(0xff88c5bc),
              strokeWidth: 0.4,
              dashArray: [1, 2, 3],
            ),
            checkToShowVerticalLine: (value) => (value % (maxY / 4) == 0),
            getDrawingVerticalLine: (value) => const FlLine(
              color: Color(0xff93d0c7),
              strokeWidth: 0.8,
            ),
          ),
          titlesData: FlTitlesData(
            show: showTitlesData,
            leftTitles: const AxisTitles(
              axisNameWidget: SizedBox(),
            ),
            topTitles: const AxisTitles(
              axisNameWidget: SizedBox(),
            ),
          ),
          borderData: FlBorderData(show: false),
          maxX: maxX,
          maxY: maxY,
          minX: minX,
          minY: minY,
          lineTouchData: const LineTouchData(
            enabled: false,
          ),
          lineBarsData: lineBarsData,
        ),
      ),
    );
  }
}
