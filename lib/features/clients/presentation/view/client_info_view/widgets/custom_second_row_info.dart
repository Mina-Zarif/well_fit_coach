import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_card_info.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_info_text_field.dart';

class CustomSecondRowInfo extends StatelessWidget {
  const CustomSecondRowInfo(
      {super.key, required this.birthDate, required this.genderValue});

  final String birthDate, genderValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: CustomInfoTextField(
            suffix: const Icon(
              Icons.date_range,
              color: kMainColor,
            ),
            label: "Date Of Birth",
            value: birthDate,
          ),
        ),
        CustomCardInfo(
          height: 50,
          width: 105,
          backgroundColor: const Color(0xfffd7956),
          value: genderValue,
          label: "Gender",
        ),
      ],
    );
  }
}
