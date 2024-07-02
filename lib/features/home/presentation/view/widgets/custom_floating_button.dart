import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: FloatingActionButton(
        backgroundColor: kMainColor,
        elevation: 5,
        tooltip: "Add Program",
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
