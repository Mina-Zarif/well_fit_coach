import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(WorkoutInitial());

  PageController workoutController = PageController();
  int workoutItems = 1;

  void addingWorkout() {
    workoutItems++;
    emit(SetState());
  }

  void removingWorkout() {
    workoutItems--;
    emit(SetState());
  }
}
