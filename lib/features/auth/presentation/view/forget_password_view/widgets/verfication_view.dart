import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/secure_storage.dart';
import 'package:well_fit_coach/core/widgets/custom_app_button.dart';
import 'package:well_fit_coach/core/widgets/custom_pin_code_fields.dart';
import 'package:well_fit_coach/core/widgets/custom_toast.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_cubit.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_state.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({
    super.key,
    required this.cubit,
    required this.state,
    this.showSteps = true,
    this.onTap,
  });

  final ForgetCubit cubit;
  final ForgetState state;
  final bool showSteps;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Visibility(
            visible: showSteps,
            child: const Text(
              "STEP 4/5",
              style: TextStyle(
                color: kMainColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Verify Your Email",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              letterSpacing: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "We’ll send the code on vertex@gmail.com",
            style: TextStyle(color: Color(0xff9F9F9F)),
          ),
          const SizedBox(height: 50),
          CustomVerificationCode(
            onChange: (value) {
              cubit.pinCode = value;
              cubit.pinCodeChecker(value);
            },
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              cubit.forgetPassword(
                onError: (error) {
                  CustomToast(context).showToast(
                    toastBody: CustomToastBody(
                      msg: error.errMessage,
                      icon: const Icon(
                        Icons.error_outline,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                onSuccess: (response) {
                  CustomToast(context).showToast(
                    toastBody: const CustomToastBody(
                      msg: "Send Mail Successfully",
                      icon: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text(
              "Send Me a New Code",
              style: TextStyle(
                color: kMainColor,
                decoration: TextDecoration.underline,
                decorationColor: kMainColor,
              ),
            ),
          ),
          const SizedBox(height: 25),
          if (state is LoadingState)
            const Center(
              child: CircularProgressIndicator(color: kMainColor),
            )
          else
            CustomAppButton(
              label: "Continue",
              activeButton: cubit.confirmPinCode,
              onTap: onTap ??
                  () {
                    cubit.verifyEmail(
                      onError: (error) {
                        CustomToast(context).showToast(
                          toastBody: CustomToastBody(
                            msg: error.errMessage,
                            icon: const Icon(
                              Icons.error_outline,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      onSuccess: (response) async {
                        CustomToast(context).showToast(
                          toastBody: const CustomToastBody(
                            msg: "Verified Mail Successfully",
                            icon: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        );
                        SecureStorage().writeSecureData(
                          id: response.id!,
                          accessToken: response.accessToken!,
                          refreshToken: response.refreshToken!,
                        );
                        cubit.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                    );
                  },
            ),
        ],
      ),
    );
  }
}
