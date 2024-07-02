import 'package:flutter/material.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';
import 'package:well_fit_coach/features/clients/presentation/view/client_info_view/widgets/custom_info_text_field.dart';

class CustomFirstRowInfo extends StatelessWidget {
  const CustomFirstRowInfo(
      {super.key, required this.heightValue, required this.weightValue});

  final String heightValue, weightValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 140,
          height: 50,
          child: CustomInfoTextField(
            suffix: const CustomRichText(
              text: "|",
              initTextStyle: TextStyle(),
              children: [
                TextSpan(text: "   Cm", style: TextStyle(color: Colors.black))
              ],
            ),
            label: "Height",
            value: heightValue,
          ),
        ),
        SizedBox(
          width: 140,
          height: 50,
          child: CustomInfoTextField(
            suffix: const CustomRichText(
              text: "|",
              initTextStyle: TextStyle(),
              children: [
                TextSpan(text: "   Kg", style: TextStyle(color: Colors.black))
              ],
            ),
            label: "Weight",
            value: weightValue,
          ),
        ),
      ],
    );
  }
}
