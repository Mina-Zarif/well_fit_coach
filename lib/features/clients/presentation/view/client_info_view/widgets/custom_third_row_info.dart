import 'package:flutter/material.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_card_info.dart';

class CustomThirdRowInfo extends StatelessWidget {
  const CustomThirdRowInfo(
      {super.key, required this.activityLevel, required this.fitnessLevel});

  final String activityLevel, fitnessLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCardInfo(
          label: "Activity Level",
          value: activityLevel,
          backgroundColor: const Color(0xfffd7956),
          width: 150,
          height: 50,
        ),
        CustomCardInfo(
          label: "Fitness Level",
          value: fitnessLevel,
          backgroundColor: const Color(0xfffd7956),
          width: 150,
          height: 50,
        ),
      ],
    );
  }
}
