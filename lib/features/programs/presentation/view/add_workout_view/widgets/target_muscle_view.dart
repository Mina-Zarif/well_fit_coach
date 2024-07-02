import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/text_styles.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/workout_cubit/workout_state.dart';
import 'package:well_fit_coach/features/programs/presentation/view/add_workout_view/widgets/target_muscle_item_view.dart';

class TargetMuscleView extends StatelessWidget {
  const TargetMuscleView({super.key, required this.cubit, required this.state});

  final WorkoutCubit cubit;
  final WorkoutState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: const Text(
            "Target Muscle",
            style: Styles.textStyle18,
          ),
          leading: const Icon(Icons.arrow_back_ios),
          leadingOnTap: () => AppRouter.router.pop(),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => TargetMuscleItemView(
              title: "Bicep",
              backgroundColor: const Color(0xfff6d9cf),
              onItemTap: () {
                cubit.workoutController
                    .nextPage(duration: kNavDuration, curve: Curves.linear);
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 35),
            itemCount: 12,
          ),
        )
      ],
    );
  }
}
