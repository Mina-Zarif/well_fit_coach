import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomToast {
  final BuildContext context;

  CustomToast(this.context) {
    fToast.init(context);
  }

  FToast fToast = FToast();

  void showToast({
    required CustomToastBody toastBody,
    int millisecondsDuration = 3000,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
  }) {
    fToast.showToast(
      toastDuration: Duration(milliseconds: millisecondsDuration),
      gravity: toastGravity,
      child: toastBody,
    );
  }
}

class CustomToastBody extends StatelessWidget {
  const CustomToastBody({
    super.key,
    this.background = kMainColor,
    this.icon,
    this.msg,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    this.radius = 25,
  });

  final Color background;
  final Widget? icon;
  final String? msg;
  final TextStyle textStyle;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kMainColor,
      borderRadius: BorderRadius.circular(radius),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? const SizedBox(),
            if (icon != null) const SizedBox(width: 10),
            Flexible(child: Text(msg ?? "", style: textStyle)),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
