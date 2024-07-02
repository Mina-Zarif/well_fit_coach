import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/contestants.dart';
import 'package:well_fit_coach/core/errors/view/error_view.dart';
import 'package:well_fit_coach/core/utils/app_router.dart';
import 'package:well_fit_coach/core/utils/secure_storage.dart';
import 'package:well_fit_coach/core/widgets/custom_refresh_indicator.dart';
import 'package:well_fit_coach/features/home/data/model/coach_response/coach_response.dart';
import 'package:well_fit_coach/features/home/presentation/mange/home_cubit/home_cubit.dart';
import 'package:well_fit_coach/features/home/presentation/mange/home_cubit/home_state.dart';
import 'package:well_fit_coach/features/home/presentation/view/widgets/home_body_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        if (state is SuccessFetchData) {
          CoachResponse response = state.response;
          return CustomRefreshIndicator(
            onRefresh: () => cubit.getHomeData(),
            child: HomeBodyView(
              response: response,
              cubit: cubit,
            ),
          );
        } else if (state is FailedFetchData) {
          return ErrorView(
            error: state.error,
            onRetry: () => cubit.getHomeData(),
            onReLogin: () async {
              AppRouter.router.pushReplacement(AppRouter.loginView);
              SecureStorage().deleteSecureData();
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: kMainColor),
          );
        }
      },
    );
  }
}
