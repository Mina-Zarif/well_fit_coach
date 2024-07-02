import 'package:flutter/material.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/features/clients/presentation/view/subscription_view/widgets/custom_bills_view.dart';

class SubscriptionBody extends StatelessWidget {
  const SubscriptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          title: const Text(
            "Subscription",
            style: TextStyle(
              letterSpacing: 1.1,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: const Icon(Icons.arrow_back_ios_new),
          leadingOnTap: () => AppRouter.router.pop(),
        ),
        const Expanded(
          child: CustomBillsView(),
        ),
      ],
    );
  }
}
