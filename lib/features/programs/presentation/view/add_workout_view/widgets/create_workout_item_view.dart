import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/widgets/custom_app_button.dart';
import 'package:well_fit_coach/core/widgets/custom_text_field.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_state.dart';

class CreateWorkoutItemView extends StatelessWidget {
  const CreateWorkoutItemView(
      {super.key,
      required this.index,
      required this.cubit,
      required this.state});

  final int index;
  final WorkoutCubit cubit;
  final WorkoutState state;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
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
            if (index == cubit.workoutItems - 1 && index != 0)
              IconButton(
                onPressed: () => cubit.removingWorkout(),
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                ),
              )
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 60,
          child: CustomTextField(
            controller: TextEditingController(),
            hintText: "Workout Name",
            filledColor: const Color(0xffF0F0F0),
            contentPadding: kContentPadding,
            borderRadius: 12,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 60,
          child: CustomTextField(
            controller: TextEditingController(),
            hintText: "Needed Tool",
            filledColor: const Color(0xffF0F0F0),
            contentPadding: kContentPadding,
            borderRadius: 12,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.42,
              height: 60,
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: "Target Muscle",
                filledColor: const Color(0xffF0F0F0),
                contentPadding: kContentPadding,
                borderRadius: 12,
              ),
            ),
            SizedBox(
              width: size.width * 0.42,
              height: 60,
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: "Weight",
                filledColor: const Color(0xffF0F0F0),
                contentPadding: kContentPadding,
                borderRadius: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.42,
              height: 60,
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: "Sets",
                filledColor: const Color(0xffF0F0F0),
                contentPadding: kContentPadding,
                borderRadius: 12,
              ),
            ),
            SizedBox(
              width: size.width * 0.42,
              height: 60,
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: "Time",
                filledColor: const Color(0xffF0F0F0),
                contentPadding: kContentPadding,
                borderRadius: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.42,
              height: 60,
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: "Calories Burned",
                filledColor: const Color(0xffF0F0F0),
                contentPadding: kContentPadding,
                borderRadius: 12,
              ),
            ),
            SizedBox(
              width: size.width * 0.42,
              height: 60,
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: "Rest",
                filledColor: const Color(0xffF0F0F0),
                contentPadding: kContentPadding,
                borderRadius: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: CustomAppButton(
            label: "Upload Video ",
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            suffixIcon: const Icon(Icons.file_upload_outlined),
            onTap: () {},
            borderRadius: 12,
            width: size.width * 0.8,
            height: 50,
            backgroundColor: const Color(0xffF0F0F0),
          ),
        ),
      ],
    );
  }
}
