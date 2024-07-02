import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/widgets/custom_app_button.dart';
import 'package:well_fit_coach/core/widgets/custom_text_field.dart';
import 'package:well_fit_coach/core/widgets/custom_toast.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_cubit.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_state.dart';
import 'package:well_fit_coach/features/auth/presentation/view/forget_password_view/widgets/custom_password_checker.dart';

class SetNewPasswordBody extends StatelessWidget {
  const SetNewPasswordBody(
      {super.key, required this.cubit, required this.state});

  final ForgetCubit cubit;
  final ForgetState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 40, start: 25, end: 25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter New Password",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: 0.7,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              onChanged: (value) => cubit.passwordStrengthChecker(value),
              controller: cubit.passwordController,
              elevation: 5,
              hintText: "Set Your Password",
              obscureText: cubit.obscurePassword,
              isPassword: true,
              textInputType: TextInputType.visiblePassword,
              onSuffixIconTap: () => cubit.getPasswordObscure(),
              suffixIconData: cubit.obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 8,
              child: CustomPassWordChecker(
                strengthCriteria: cubit.strengthCriteria,
              ),
            ),
            const SizedBox(height: 20),
            const CustomCheckerDataView(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.1,
                color: Color(0xff4C5980),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Confirm Password",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: 0.7,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              elevation: 5,
              controller: cubit.confirmPassword,
              hintText: "Confirm Your New Password",
              isPassword: true,
              onSuffixIconTap: () => cubit.getConfirmPasswordObscure(),
              textInputType: TextInputType.visiblePassword,
              obscureText: cubit.obscureConfirmPassword,
              onChanged: (value) => cubit.confirmPasswordOnChange(value),
              suffixIconData: cubit.obscureConfirmPassword
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            const SizedBox(height: 25),
            if (state is LoadingState)
              const Center(
                child: CircularProgressIndicator(
                  color: kMainColor,
                ),
              )
            else
              Center(
                child: CustomAppButton(
                  activeButton: cubit.confirmNewPassword,
                  label: "Confirm",
                  textStyle: TextStyle(
                    color: (cubit.confirmNewPassword)
                        ? Colors.white
                        : Colors.grey[300],
                    letterSpacing: 0.8,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    cubit.setNewPassword(
                      onSuccess: (response) async {
                        CustomToast(context).showToast(
                          toastBody: const CustomToastBody(
                            msg: "Updated Password Successfully",
                            icon: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        );
                        AppRouter.router.pushReplacement(AppRouter.homeView);
                      },
                      onError: (error) => CustomToast(context).showToast(
                        toastBody: CustomToastBody(
                          msg: error.errMessage,
                          icon: const Icon(
                            Icons.error_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
