import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:well_fit_coach/core/functions/select_range_days.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_state.dart';

class ProgramsCubit extends Cubit<ProgramsState> {
  ProgramsCubit() : super(ProgramsInitial());

  bool isWorkoutActive = true, programNameValidation = false;
  DateTime programDateTime = DateTime.now();
  PageController dialogController = PageController();
  TextEditingController newProgramName = TextEditingController();
  DateTime? startDate, endDate;

  void onProgramNameValidate(String value) {
    programNameValidation = value.isNotEmpty;
    emit(ProgramsWorkOutState());
  }

  void selectRangeOfDays(dynamic p0) {
    PickerDateRange pickerDateRange = selectDaysRange(p0: p0);
    startDate = pickerDateRange.startDate;
    endDate = pickerDateRange.endDate;
    emit(UpdateProgramDateTimeState());
  }

  void goToDayProgram() {
    programDateTime = DateTime.now();
    emit(GoToDayState());
  }

  void updateProgramDateTime(DateTime dateTime) {
    programDateTime = dateTime;
    emit(UpdateProgramDateTimeState());
  }

  void toggleWorkoutAndNutrition() {
    isWorkoutActive = !isWorkoutActive;
    emit(ProgramsWorkOutState());
  }
}
