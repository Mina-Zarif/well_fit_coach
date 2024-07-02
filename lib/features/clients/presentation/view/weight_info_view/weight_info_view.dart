import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/features/clients/presentation/view/weight_info_view/widgets/weight_info_body.dart';

class WeightInfoView extends StatelessWidget {
  const WeightInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kMainColor,
      body: WeightInfoBody(),
    );
  }
}
