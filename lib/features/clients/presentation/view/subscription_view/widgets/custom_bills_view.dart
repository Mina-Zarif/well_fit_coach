import 'package:flutter/material.dart';
import 'package:well_fit_coach/features/clients/presentation/view/subscription_view/widgets/custom_current_plane_body.dart';
import 'package:well_fit_coach/features/clients/presentation/view/subscription_view/widgets/custom_subscription_card.dart';

class CustomBillsView extends StatelessWidget {
  const CustomBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Current Plan",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 20),
          CustomSubscriptionCard(
            title: "Building Muscles",
            price: "20.88",
            bodyCard: CustomCurrentPlaneBody(),
          ),
          SizedBox(height: 35),
          Text(
            "Past Plan",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 20),
          CustomSubscriptionCard(
            title: "Diet Plan",
            bodyCard: Row(
              children: [
                Text(
                  "Show All Features",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff23262F),
                  ),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            price: "31.45",
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
