import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/features/home/presentation/mange/main_cubit/main_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(MainInitial());

  int currentIndex = 0;
  PageController homePageController = PageController();
  DateTime? dateTime;

  void pickDate(p0) {
    dateTime = p0;
    emit(MainSetState());
  }

  void toggleNavBar(value) {
    homePageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    currentIndex = value;
    emit(MainToggleState());
  }
}
