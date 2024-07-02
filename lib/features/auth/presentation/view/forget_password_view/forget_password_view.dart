import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/widgets/custom_appbar.dart';
import 'package:well_fit_coach/core/widgets/custom_liner_stepper.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_cubit.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_state.dart';
import 'package:well_fit_coach/features/auth/presentation/view/forget_password_view/widgets/forget_pass_body.dart';
import 'package:well_fit_coach/features/auth/presentation/view/forget_password_view/widgets/set_new_password_body.dart';
import 'package:well_fit_coach/features/auth/presentation/view/forget_password_view/widgets/verfication_view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetCubit, ForgetState>(
      builder: (context, state) {
        ForgetCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: CustomAppBar(
            backgroundColor: kBackgroundColor,
            leading: (cubit.pageControllerIndex == 0 ||
                    cubit.pageControllerIndex == 1)
                ? const Icon(Icons.arrow_back_ios_new)
                : const SizedBox(),
            leadingOnTap: () {
              if (cubit.pageControllerIndex == 0) {
                AppRouter.router.pop();
              } else if (cubit.pageControllerIndex == 1) {
                cubit.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              }
              // else cubit.pageController.previousPage(
              //     duration: const Duration(milliseconds: 300),
              //     curve: Curves.linear,
              //   );
            },
            title: CustomLinerStepper(
                step: (cubit.pageControllerIndex + 1), totalSteps: 3),
          ),
          backgroundColor: kBackgroundColor,
          body: PageView(
            onPageChanged: (value) => cubit.setPageIndex(value),
            physics: const NeverScrollableScrollPhysics(),
            controller: cubit.pageController,
            children: [
              ForgetPasswordBody(
                state: state,
                cubit: cubit,
              ),
              VerificationView(
                cubit: cubit,
                state: state,
                showSteps: false,
              ),
              SetNewPasswordBody(
                state: state,
                cubit: cubit,
              ),
            ],
          ),
        );
      },
    );
  }
}
