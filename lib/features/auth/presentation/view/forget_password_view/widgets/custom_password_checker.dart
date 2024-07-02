import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomPassWordChecker extends StatelessWidget {
  const CustomPassWordChecker({super.key, required this.strengthCriteria});

  final List<bool> strengthCriteria;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 65,
              height: 7,
              decoration: BoxDecoration(
                  color: (strengthCriteria[0])
                      ? kMainColor
                      : const Color(0xffFFE6DF),
                  borderRadius: BorderRadius.circular(16)),
            ),
            Container(
              width: 65,
              height: 7,
              decoration: BoxDecoration(
                  color: (strengthCriteria[1])
                      ? kMainColor
                      : const Color(0xffFFE6DF),
                  borderRadius: BorderRadius.circular(16)),
            ),
            Container(
              width: 65,
              height: 7,
              decoration: BoxDecoration(
                  color: (strengthCriteria[2])
                      ? kMainColor
                      : const Color(0xffFFE6DF),
                  borderRadius: BorderRadius.circular(16)),
            ),
            Container(
              width: 65,
              height: 7,
              decoration: BoxDecoration(
                  color: (strengthCriteria[3])
                      ? kMainColor
                      : const Color(0xffFFE6DF),
                  borderRadius: BorderRadius.circular(16)),
            ),
            Container(
              width: 65,
              height: 7,
              decoration: BoxDecoration(
                color: (strengthCriteria[4])
                    ? kMainColor
                    : const Color(0xffFFE6DF),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomCheckerDataView extends StatelessWidget {
  const CustomCheckerDataView({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  // final List<bool> strengthCriteria;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "• 8+ Characters",
              style: textStyle,
            ),
            const Spacer(),
            Text(
              "• 1 Uppercase Letter",
              style: textStyle,
            )
          ],
        ),
        Row(
          children: [
            Text(
              "• 1 Symbol",
              style: textStyle,
            ),
            const Spacer(),
            Text(
              "• 1 Lower Letter",
              style: textStyle,
            ),
          ],
        ),
        Text(
          "• 1 Number",
          style: textStyle,
        ),
      ],
    );
  }
}
