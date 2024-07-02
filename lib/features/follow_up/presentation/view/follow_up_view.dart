import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/errors/view/error_view.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/secure_storage.dart';
import 'package:well_fit_coach/core/widgets/custom_refresh_indicator.dart';
import 'package:well_fit_coach/features/follow_up/presentation/mange/followup_cubit/followup_cubit.dart';
import 'package:well_fit_coach/features/follow_up/presentation/mange/followup_cubit/followup_state.dart';
import 'package:well_fit_coach/features/follow_up/presentation/view/widgets/follow_up_body.dart';

class FollowUpView extends StatelessWidget {
  const FollowUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: BlocBuilder<FollowUpCubit, FollowUpState>(
          builder: (context, state) {
            final FollowUpCubit cubit = BlocProvider.of(context);
            if (state is SuccessFetchData) {
              return CustomRefreshIndicator(
                child: FollowUpBody(
                  cubit: cubit,
                  state: state,
                  response: state.response,
                ),
                onRefresh: () => cubit.getMeetingsData(),
              );
            } else if (state is FailedFetchData) {
              return ErrorView(
                error: state.error,
                onReLogin: () async {
                  AppRouter.router.pushReplacement(AppRouter.loginView);
                  SecureStorage().deleteSecureData();
                },
                onRetry: () => cubit.getMeetingsData(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: kMainColor),
            );
          },
        ),
      ),
    );
  }
}
