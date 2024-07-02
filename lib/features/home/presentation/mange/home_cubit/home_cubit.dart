import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/core/utils/service_locator.dart';
import 'package:well_fit_coach/features/auth/data/models/token_model/token_model.dart';
import 'package:well_fit_coach/features/home/data/repo/home_repo/home_repo_impl.dart';
import 'package:well_fit_coach/features/home/presentation/mange/home_cubit/home_state.dart';

import '../../../../../core/utils/secure_storage.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeRepoImpl _homeRepoImpl = HomeRepoImpl(getIt.get<ApiService>());

  Future<void> getHomeData() async {
    emit(LoadingHomeData());
    TokenModel? tokenModel = await SecureStorage().readSecureData();
    var data = await _homeRepoImpl.fetchHomeData(
      id: tokenModel!.id!,
      accessToken: tokenModel.accessToken!,
      refreshToken: tokenModel.refreshToken!,
    );
    data.fold(
      (error) => emit(FailedFetchData(error: error)),
      (response) => emit(SuccessFetchData(response: response)),
    );
  }
}
