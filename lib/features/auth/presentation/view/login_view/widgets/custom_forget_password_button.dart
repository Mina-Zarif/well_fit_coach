import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomForgetPassButton extends StatelessWidget {
  const CustomForgetPassButton({
    super.key,
    required this.rememberMe,
    required this.onChanged,
    required this.onForgetPassButton,
  });

  final bool rememberMe;
  final Function() onChanged, onForgetPassButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) => onChanged(),
          shape: const CircleBorder(),
          activeColor: kMainColor,
        ),
        InkWell(
          onTap: onChanged,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: const Text(
            "Remember me",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onForgetPassButton,
          child: const Text(
            "Forgot password",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
