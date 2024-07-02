import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomVerificationCode extends StatelessWidget {
  CustomVerificationCode({
    super.key,
    this.onChange,
    this.onCompleted,
  });

  final TextEditingController codeController = TextEditingController();
  final Function(String value)? onCompleted, onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: PinCodeTextField(
        appContext: context,
        keyboardType: TextInputType.number,
        showCursor: false,
        obscureText: false,
        length: 4,
        animationType: AnimationType.fade,
        textStyle: const TextStyle(fontSize: 35),
        pinTheme: PinTheme(
          selectedFillColor: Colors.transparent,
          selectedColor: kMainColor,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(50),
          fieldOuterPadding: EdgeInsets.zero,
          fieldHeight: 45,
          fieldWidth: 45,
          errorBorderColor: Colors.red,
          inactiveColor: const Color(0xffFFF1ED),
          inactiveFillColor: const Color(0xffFFF1ED),
          activeFillColor: Colors.transparent,
          activeColor: Colors.transparent,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: codeController,
        onChanged: (value) => (onChange != null) ? onChange!(value) : () {},
        onCompleted: (value) =>
            (onCompleted != null) ? onCompleted!(value) : () {},
      ),
    );
  }
}
