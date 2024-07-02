import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/features/clients/presentation/view/water_info_view/widgets/water_info_body.dart';

class WaterInfoView extends StatelessWidget {
  const WaterInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontal),
        child: WaterInfoBody(),
      ),
    );
  }
}
