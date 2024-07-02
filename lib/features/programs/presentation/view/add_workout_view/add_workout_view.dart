import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_state.dart';
import 'package:well_fit_coach/features/programs/presentation/view/add_workout_view/widgets/choose_workout_view.dart';
import 'package:well_fit_coach/features/programs/presentation/view/add_workout_view/widgets/create_workout_view.dart';
import 'package:well_fit_coach/features/programs/presentation/view/add_workout_view/widgets/target_muscle_view.dart';

class AddWorkoutView extends StatelessWidget {
  const AddWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontal),
        child: BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (context, state) {
            WorkoutCubit cubit = BlocProvider.of(context);
            return PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: cubit.workoutController,
              children: [
                TargetMuscleView(
                  cubit: cubit,
                  state: state,
                ),
                CreateWorkoutView(
                  cubit: cubit,
                  state: state,
                ),
                ChooseWorkoutView(
                  cubit: cubit,
                  state: state,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
