import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/functions/validation.dart';
import 'package:well_fit_coach/core/widgets/custom_app_button.dart';
import 'package:well_fit_coach/core/widgets/custom_text_field.dart';
import 'package:well_fit_coach/core/widgets/custom_toast.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_cubit.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_state.dart';

class ForgetPasswordBody extends StatelessWidget {
  ForgetPasswordBody({super.key, required this.cubit, required this.state});

  final ForgetCubit cubit;
  final ForgetState state;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 60, start: 30, end: 30),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Enter Your Email Address",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xff2D3142),
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  elevation: 7,
                  controller: cubit.emailController,
                  validator: (value) => validateEmail(value),
                  hintText: 'example@gmail.com',
                  textInputType: TextInputType.emailAddress,
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff828894),
                  ),
                ),
                const SizedBox(height: 40),
                if (state is LoadingState)
                  const Center(
                    child: CircularProgressIndicator(color: kMainColor),
                  )
                else
                  CustomAppButton(
                    label: "Send Verification",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
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
                            cubit.pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          },
                        );
                      }
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
