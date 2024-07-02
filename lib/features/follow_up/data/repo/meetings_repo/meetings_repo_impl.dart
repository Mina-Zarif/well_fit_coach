// ignore_for_file: deprecated_member_use
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/features/follow_up/data/model/meetings_model/meetings_model.dart';
import 'package:well_fit_coach/features/follow_up/data/repo/meetings_repo/meetings_repo.dart';

class MeetingsRepoImpl implements MeetingsRepo {
  final ApiService apiService;

  MeetingsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, MeetingsModel>> fetchMeetings({
    required String id,
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      var data = await apiService.get(
        endpoint: "v1/api/coaches/$id/meetings",
        token: accessToken,
        refreshToken: refreshToken,
      );
      return Right(MeetingsModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
