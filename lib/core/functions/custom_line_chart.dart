import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChartBarData customLineChartBarData({
  required Color lineColor,
  required List<FlSpot> spots,
  required double maxY,
}) {
  return LineChartBarData(
    color: lineColor,
    spots: spots,
    isCurved: true,
    dotData: FlDotData(checkToShowDot: (spot, barData) => (spot.x == maxY)),
    belowBarData: BarAreaData(show: false),
  );
}
