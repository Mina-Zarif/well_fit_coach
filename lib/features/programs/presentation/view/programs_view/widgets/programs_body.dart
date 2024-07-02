import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/functions/compare_date_time.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/text_styles.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/core/widgets/custom_calender_time_line.dart';
import 'package:well_fit_coach/features/home/presentation/mange/main_cubit/main_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_cubit.dart';
import 'package:well_fit_coach/features/programs/presentation/mange/programs_cubit/programs_state.dart';
import 'package:well_fit_coach/features/programs/presentation/view/programs_view/widgets/program_item_view.dart';

import 'custom_add_work_or_nutrition.dart';
import 'custom_switch_button.dart';

class ProgramsBody extends StatelessWidget {
  const ProgramsBody({super.key, required this.cubit, required this.state});

  final ProgramsCubit cubit;
  final ProgramsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: const Text(
            "Program",
            style: Styles.textStyle18,
          ),
          leading: const Icon(Icons.arrow_back_ios),
          leadingOnTap: () =>
              BlocProvider.of<AppCubit>(context).toggleNavBar(0),
          actionOnTap: () => cubit.goToDayProgram(),
          action: const Text(
            "TODAY",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: kMainColor,
            ),
          ),
        ),
        CustomCalenderTimeLine(
          initialDate: cubit.programDateTime,
          onDateSelected: (dateTime) => cubit.updateProgramDateTime(dateTime),
        ),
        const SizedBox(height: 25),
        CustomSwitchButton(
          onTap: () => cubit.toggleWorkoutAndNutrition(),
          isWorkoutActive: cubit.isWorkoutActive,
        ),
        const SizedBox(height: 20),
        if (compareDateTime(cubit.programDateTime))
          if (cubit.isWorkoutActive)
            CustomAddWorkOrNutrition(
              title: "Add Workout",
              onTap: () => AppRouter.router.push(AppRouter.addWorkout),
            )
          else
            CustomAddWorkOrNutrition(
              title: "Add Meal",
              onTap: () {},
            ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => ProgramItemView(
              index: index,
              isWorkoutActive: cubit.isWorkoutActive,
            ),
            itemCount: 1,
          ),
        ),
      ],
    );
  }
}
