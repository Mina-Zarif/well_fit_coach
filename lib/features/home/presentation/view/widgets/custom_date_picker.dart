import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.onSubmit,
    this.dateRangePickerSelectionMode = DateRangePickerSelectionMode.single,
    this.showTodayButton = true,
    this.startDate,
    this.endDate,
  });

  final Function(dynamic p0) onSubmit;
  final DateRangePickerSelectionMode dateRangePickerSelectionMode;
  final bool showTodayButton;
  final DateTime? startDate, endDate;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).size.height * 0.35,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(25), bottomStart: Radius.circular(25)),
          child: SfDateRangePicker(
            initialSelectedRange: PickerDateRange(startDate, endDate),
            minDate: DateTime.now(),
            onCancel: () => Navigator.pop(context),
            onSubmit: (p0) {
              Navigator.pop(context);
              return onSubmit(p0);
            },
            selectionColor: kMainColor,
            todayHighlightColor: kMainColor,
            rangeSelectionColor: const Color(0xfffbdbd0),
            startRangeSelectionColor: kMainColor,
            endRangeSelectionColor: kMainColor,
            headerHeight: 120,
            showActionButtons: true,
            showNavigationArrow: true,
            showTodayButton: showTodayButton,
            toggleDaySelection: true,
            selectionMode: dateRangePickerSelectionMode,
            headerStyle: const DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 50,
                wordSpacing: 2,
              ),
            ),
            backgroundColor: Colors.white,
            view: DateRangePickerView.month,
          ),
        ),
      ),
    );
  }
}
