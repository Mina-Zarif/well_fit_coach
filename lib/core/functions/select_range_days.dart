import 'package:syncfusion_flutter_datepicker/datepicker.dart';

PickerDateRange selectDaysRange({required dynamic p0}) {
  DateTime? startDate, endDate;
  if (p0 != null && p0.startDate != null && p0.endDate != null) {
    startDate = DateTime.parse(p0.startDate.toString());
    endDate = DateTime.parse(p0.endDate.toString());
  } else {
    startDate = null;
    endDate = null;
  }
  return PickerDateRange(startDate, endDate);
}
