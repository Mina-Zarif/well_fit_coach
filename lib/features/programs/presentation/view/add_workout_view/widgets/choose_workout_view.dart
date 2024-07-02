import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/widgets/custom_app_button.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/core/widgets/custom_text_field.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_state.dart';

class ChooseWorkoutView extends StatelessWidget {
  const ChooseWorkoutView({
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
          title: const Text("Choose Workout"),
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == cubit.workoutItems - 1) {
                return Column(
                  children: [
                    ChooseWorkoutItemView(
                      index: index,
                      cubit: cubit,
                      state: state,
                    ),
                    ChooseWorkoutButtons(
                      cubit: cubit,
                      state: state,
                    ),
                  ],
                );
              }
              return ChooseWorkoutItemView(
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

class ChooseWorkoutItemView extends StatelessWidget {
  const ChooseWorkoutItemView({
    super.key,
    required this.cubit,
    required this.state,
    required this.index,
  });

  final WorkoutCubit cubit;
  final WorkoutState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 15,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Workout ${(index + 1).toString()}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () => cubit.removingWorkout(),
                icon: const Icon(
                  Icons.check_circle,
                  color: kMainColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const ChooseWorkoutTextField(
            labelText: "Workout Name",
            contentText: "Wide-Grip Curl",
          ),
          const SizedBox(height: 10),
          const ChooseWorkoutTextField(
            labelText: "Needed Tool",
            contentText: "Dumbbells",
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: size.height * 0.35,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2.5,
                crossAxisSpacing: 2.5,
                childAspectRatio: 1.8,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => const ChooseWorkoutTextField(
                labelText: "Target Muscle",
                contentText: "Bicep",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChooseWorkoutTextField extends StatelessWidget {
  const ChooseWorkoutTextField({
    super.key,
    required this.labelText,
    required this.contentText,
  });

  final String labelText, contentText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 55,
          child: CustomTextField(
            controller: TextEditingController(text: contentText),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.black,
            ),
            enabled: false,
            filledColor: Colors.white,
            contentPadding: kContentPadding,
            borderRadius: 12,
          ),
        ),
      ],
    );
  }
}

class ChooseWorkoutButtons extends StatelessWidget {
  const ChooseWorkoutButtons(
      {super.key, required this.cubit, required this.state});

  final WorkoutCubit cubit;
  final WorkoutState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        CustomAppButton(
          width: 200,
          height: 50,
          borderRadius: 50,
          label: "Add workout",
          onTap: () {},
        ),
        const SizedBox(height: 25),
        const Text(
          "Or Create A New Workouts",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomAppButton(
          height: 50,
          borderRadius: 50,
          label: "Add Workout",
          onTap: () => cubit.workoutController.previousPage(
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
