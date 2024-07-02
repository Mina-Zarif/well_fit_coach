import 'package:flutter/material.dart';
import 'package:well_fit_coach/features/clients/presentation/view/calories_info_view/widgets/calories_info_body.dart';

class CaloriesInfoView extends StatelessWidget {
  const CaloriesInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: CaloriesInfoBody(),
      ),
    );
  }
}
