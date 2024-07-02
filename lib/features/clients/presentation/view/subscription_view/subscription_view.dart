import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/features/clients/presentation/view/subscription_view/widgets/subscription_body.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
        child: SubscriptionBody(),
      ),
    );
  }
}
