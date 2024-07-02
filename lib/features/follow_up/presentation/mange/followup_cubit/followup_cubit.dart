import 'package:bloc/bloc.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/core/utils/secure_storage.dart';
import 'package:well_fit_coach/core/utils/service_locator.dart';
import 'package:well_fit_coach/features/auth/data/models/token_model/token_model.dart';
import 'package:well_fit_coach/features/follow_up/data/repo/meetings_repo/meetings_repo_impl.dart';
import 'package:well_fit_coach/features/follow_up/presentation/mange/followup_cubit/followup_state.dart';

class FollowUpCubit extends Cubit<FollowUpState> {
  FollowUpCubit() : super(FollowUpInitial());

  DateTime selectedDataTime = DateTime.now();

  final MeetingsRepoImpl _meetingsRepoImpl =
      MeetingsRepoImpl(getIt.get<ApiService>());

  Future<void> getMeetingsData() async {
    emit(LoadingState());

    TokenModel? tokenModel = await SecureStorage().readSecureData();
    var data = await _meetingsRepoImpl.fetchMeetings(
      id: tokenModel!.id!,
      accessToken: tokenModel.accessToken!,
      refreshToken: tokenModel.refreshToken!,
    );
    data.fold(
      (error) => emit(FailedFetchData(error: error)),
      (response) => emit(SuccessFetchData(response: response)),
    );
  }

  void goToDay() {
    selectedDataTime = DateTime.now();
    emit(GoToDayState());
  }
}
