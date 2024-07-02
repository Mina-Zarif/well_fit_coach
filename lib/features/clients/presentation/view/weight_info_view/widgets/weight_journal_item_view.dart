import 'package:flutter/material.dart';

class WeightJournalItemView extends StatelessWidget {
  const WeightJournalItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            "50.5",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
