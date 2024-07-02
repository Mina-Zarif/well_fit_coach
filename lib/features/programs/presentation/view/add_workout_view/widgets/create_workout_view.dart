import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/widgets/custom_app_button.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_state.dart';
import 'package:well_fit_coach/features/programs/presentation/view/add_workout_view/widgets/create_workout_item_view.dart';
import 'package:well_fit_coach/features/programs/presentation/view/programs_view/widgets/custom_add_work_or_nutrition.dart';

class CreateWorkoutView extends StatelessWidget {
  const CreateWorkoutView({
    super.key,
    required this.cubit,
    required this.state,
  });

  final WorkoutCubit cubit;
  final WorkoutState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          leading: const Icon(Icons.arrow_back_ios),
          leadingOnTap: () => cubit.workoutController.previousPage(
            duration: kNavDuration,
            curve: Curves.linear,
          ),
          title: const Text("New Workout"),
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == cubit.workoutItems - 1) {
                return Column(
                  children: [
                    CreateWorkoutItemView(
                      index: index,
                      cubit: cubit,
                      state: state,
                    ),
                    CreateWorkoutButtons(
                      cubit: cubit,
                      state: state,
                    ),
                  ],
                );
              }
              return CreateWorkoutItemView(
                index: index,
                cubit: cubit,
                state: state,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 50),
            itemCount: cubit.workoutItems,
          ),
        ),
      ],
    );
  }
}

class CreateWorkoutButtons extends StatelessWidget {
  const CreateWorkoutButtons(
      {super.key, required this.cubit, required this.state});

  final WorkoutCubit cubit;
  final WorkoutState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        CustomAddWorkOrNutrition(
          onTap: () => cubit.addingWorkout(),
          title: 'Add Workout',
        ),
        const SizedBox(height: 20),
        CustomAppButton(
          width: 150,
          height: 50,
          borderRadius: 50,
          label: "Save",
          onTap: () {},
        ),
        const SizedBox(height: 25),
        const Text(
          "Or Choose From Existing Workouts",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),
        CustomAppButton(
          height: 50,
          borderRadius: 50,
          label: "Choose Workout",
          onTap: () => cubit.workoutController.nextPage(
            duration: kNavDuration,
            curve: Curves.linear,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
