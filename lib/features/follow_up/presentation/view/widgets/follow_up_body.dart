import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/core/widgets/custom_calender_time_line.dart';
import 'package:well_fit_coach/features/follow_up/data/model/meetings_model/meetings_model.dart';
import 'package:well_fit_coach/features/follow_up/presentation/mange/followup_cubit/followup_cubit.dart';
import 'package:well_fit_coach/features/follow_up/presentation/mange/followup_cubit/followup_state.dart';
import 'package:well_fit_coach/features/follow_up/presentation/view/widgets/follow_up_card_item.dart';
import 'package:well_fit_coach/features/home/presentation/mange/main_cubit/main_cubit.dart';

class FollowUpBody extends StatelessWidget {
  const FollowUpBody(
      {super.key,
      required this.cubit,
      required this.state,
      required this.response});

  final FollowUpCubit cubit;
  final FollowUpState state;
  final MeetingsModel response;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: const Text(
            "Follow up",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          leading: const Icon(Icons.arrow_back_ios),
          leadingOnTap: () =>
              BlocProvider.of<AppCubit>(context).toggleNavBar(0),
          // actionOnTap: () => cubit.goToDay(),
          action: const Text(
            "TODAY",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: kMainColor,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                FollowUpCardItem(datum: response.data![index]),
            itemCount: response.data!.length,
          ),
        ),
        SizedBox(
          height: 100,
          child: CustomCalenderTimeLine(
            onDateSelected: (dateTime) => cubit.selectedDataTime = dateTime,
            initialDate: cubit.selectedDataTime,
          ),
        ),
        const SizedBox(height: 25)
      ],
    );
  }
}
