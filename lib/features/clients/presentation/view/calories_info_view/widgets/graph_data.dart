import 'package:flutter/material.dart';

class GraphData extends StatelessWidget {
  const GraphData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 6,
        ),
        Text(
          "Calories",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 6,
        ),
        Text(
          "Carbs",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 6,
        ),
        Text(
          "Fat",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        CircleAvatar(
          backgroundColor: Colors.purple,
          radius: 6,
        ),
        Text(
          "Protein",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }
}
