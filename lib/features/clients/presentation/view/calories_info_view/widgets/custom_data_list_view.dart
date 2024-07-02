import 'package:flutter/material.dart';

class CustomDataListView extends StatelessWidget {
  const CustomDataListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const CustomDataItemView(
        backgroundColor: Colors.red,
        value: "100 g",
        label: "Carbs",
        percentValue: "28%",
      ),
      itemCount: 4,
    );
  }
}

class CustomDataItemView extends StatelessWidget {
  const CustomDataItemView(
      {super.key,
      required this.backgroundColor,
      required this.label,
      required this.value,
      required this.percentValue});

  final Color backgroundColor;
  final String label, value, percentValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const Spacer(),
          Text(
            percentValue,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
