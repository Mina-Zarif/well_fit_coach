// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/features/clients/presentation/view/steps_info_view/widgets/custom_circular_chart.dart';

class CustomListDetails extends StatelessWidget {
  const CustomListDetails({super.key, required this.averages});

  final List<double> averages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          CustomCircularChart(
            size: const Size(100, 100),
            average: averages[0],
            color: const Color(0xffFF296A),
            text: "31 kcal",
            child: SvgPicture.asset(
              AssetsApp.fireIcon,
              color: const Color(0xffFF296A),
            ),
          ),
          CustomCircularChart(
            size: const Size(100, 100),
            average: averages[1],
            color: const Color(0xff9850CF),
            text: "2 km",
            child: const Icon(
              Icons.location_on,
              size: 35,
              color: Color(0xff9850CF),
            ),
          ),
          CustomCircularChart(
            size: const Size(100, 100),
            average: averages[2],
            color: const Color(0xff0067DE),
            text: "50 min",
            child: const Icon(
              Icons.timelapse_sharp,
              size: 35,
              color: Color(0xff0067DE),
            ),
          ),
        ],
      ),
    );
  }
}
