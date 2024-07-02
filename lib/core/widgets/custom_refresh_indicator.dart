import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator(
      {super.key, required this.onRefresh, required this.child});

  final Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      color: kMainColor,
      strokeWidth: 1.5,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 1500));
        onRefresh();
      },
      child: child,
    );
  }
}
