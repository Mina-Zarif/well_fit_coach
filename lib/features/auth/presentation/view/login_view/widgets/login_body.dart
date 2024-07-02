import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/functions/validation.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/assets_app.dart';
import 'package:well_fit_coach/core/utils/secure_storage.dart';
import 'package:well_fit_coach/core/utils/text_styles.dart';
import 'package:well_fit_coach/core/widgets/custom_app_button.dart';
import 'package:well_fit_coach/core/widgets/custom_text_field.dart';
import 'package:well_fit_coach/core/widgets/custom_toast.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/auth_cubit/auth_cubit.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/auth_cubit/auth_state.dart';
import 'package:well_fit_coach/features/auth/presentation/view/login_view/widgets/custom_forget_password_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key, required this.cubit, required this.state});

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 80, start: 25, end: 25),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  AssetsApp.logo,
                  width: 270,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                "Email",
                style: Styles.textStyle20,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                elevation: 5,
                controller: cubit.emailController,
                validator: (value) => validateEmail(value),
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: Styles.textStyle20,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                elevation: 5,
                controller: cubit.passwordController,
                validator: (value) => validatePassword(value),
                hintText: "Password",
                textInputType: TextInputType.visiblePassword,
                isPassword: true,
                suffixIconData: cubit.obscurePassword
                    ? Icons.visibility_off
                    : Icons.visibility_rounded,
                onSuffixIconTap: () => cubit.getPasswordObscure(),
                obscureText: cubit.obscurePassword,
              ),
              const SizedBox(height: 20),
              CustomForgetPassButton(
                rememberMe: cubit.rememberMe,
                onChanged: () => cubit.rememberMeCheck(),
                onForgetPassButton: () =>
                    AppRouter.router.push(AppRouter.forgetView),
              ),
              const SizedBox(height: 25),
              if (state is LoadingLoginState)
                const Center(
                  child: CircularProgressIndicator(
                    color: kMainColor,
                  ),
                )
              else
                Center(
                  child: CustomAppButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        cubit.loginProcess(
                          onSucess: (response) async {
                            CustomToast(context).showToast(
                              toastBody: const CustomToastBody(
                                msg: "Login Successfully",
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                            );
                            SecureStorage().writeSecureData(
                              id: response.data!.id!,
                              accessToken: response.accessToken!,
                              refreshToken: response.refreshToken!,
                            );
                            AppRouter.router
                                .pushReplacement(AppRouter.homeView);
                          },
                          onError: (error) => CustomToast(context).showToast(
                            toastBody: CustomToastBody(
                              msg: error.errMessage,
                              icon: const Icon(
                                Icons.bug_report_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    label: "Login",
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
