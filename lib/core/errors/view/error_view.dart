import 'package:flutter/material.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/widgets/custom_app_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(
      {super.key,
      required this.error,
      required this.onRetry,
      required this.onReLogin});

  final Failure error;
  final Function() onRetry, onReLogin;
  final String responseMessage = "Session Expired, Please login and try again!";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: size.height * 0.08,
        start: 5,
        end: 5,
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset(AssetsApp.connectionErrorImage),
            const SizedBox(height: 35),
            const Text(
              "Oops",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              error.errMessage!,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: const TextStyle(
                height: 1.5,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                wordSpacing: 1.5,
                color: Color(0xffbcbcbc),
              ),
            ),
            SizedBox(height: size.height * 0.1),
            CustomAppButton(
              label: (error.errMessage == responseMessage) ? "Login" : "Retry",
              onTap:
                  (error.errMessage == responseMessage) ? onReLogin : onRetry,
              height: 50,
              width: size.width,
            )
          ],
        ),
      ),
    );
  }
}
