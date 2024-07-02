// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/features/clients/presentation/view/steps_info_view/widgets/custom_circular_chart.dart';
import 'package:well_fit_coach/features/clients/presentation/view/steps_info_view/widgets/custom_daily_graph.dart';
import 'package:well_fit_coach/features/clients/presentation/view/steps_info_view/widgets/custom_list_details.dart';

class StepsInfoBody extends StatelessWidget {
  const StepsInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontal),
          child: CustomAppBar(
            leading: const Icon(Icons.arrow_back_ios),
            leadingOnTap: () => AppRouter.router.pop(),
          ),
        ),
        const Text(
          "DAILY STEPS",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff07D5AE),
            height: 1.9,
          ),
        ),
        const CustomRichText(
          text: "Have walked ",
          initTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
          children: [
            TextSpan(text: "80%\n", style: TextStyle(color: Color(0xffFF592C))),
            TextSpan(text: " of his/her goal")
          ],
        ),
        const SizedBox(height: 10),
        CustomCircularChart(
          color: const Color(0xff07D5AE),
          size: const Size(250, 250),
          average: 77,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                AssetsApp.stepsIcon,
                height: 35,
                width: 35,
                color: const Color(0xff07D5AE),
              ),
              const Text(
                "7,203",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
              ),
              const Text(
                "Steps",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
              ),
            ],
          ),
        ),
        const CustomListDetails(
          averages: [80, 50, 60],
        ),
        const Expanded(
          child: CustomDailyGraph(
            data: [30, 40, 60, 60, 80, 20, 25],
          ),
        ),
      ],
    );
  }
}
