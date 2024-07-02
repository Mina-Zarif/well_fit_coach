import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/custom_rich_text.dart';

class CustomSubscriptionCard extends StatelessWidget {
  const CustomSubscriptionCard(
      {super.key,
      required this.title,
      required this.price,
      required this.bodyCard});

  final String title, price;
  final Widget bodyCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: kMainColor,
                ),
              ),
              const SizedBox(height: 24),
              CustomRichText(
                text: "\$ ",
                initTextStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
                children: [
                  TextSpan(
                    text: price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "per month",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff777E90),
                ),
              ),
              const SizedBox(height: 15),
              bodyCard,
            ],
          ),
        ),
      ),
    );
  }
}
