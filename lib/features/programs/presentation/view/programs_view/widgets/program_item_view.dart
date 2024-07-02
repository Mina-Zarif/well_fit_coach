import 'package:flutter/material.dart';

class ProgramItemView extends StatelessWidget {
  const ProgramItemView(
      {super.key, required this.index, required this.isWorkoutActive});

  final int index;
  final bool isWorkoutActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.5),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              isWorkoutActive ? "Workout ${index + 1}" : "Meal ${index + 1}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.keyboard_arrow_down)
          ],
        ),
      ),
    );
  }
}
