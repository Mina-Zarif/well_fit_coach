// ignore_for_file: deprecated_member_use
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/features/home/data/model/coach_response/coach_response.dart';
import 'package:well_fit_coach/features/home/data/repo/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CoachResponse>> fetchHomeData(
      {required String id,
      required String accessToken,
      required String refreshToken}) async {
    try {
      var data = await apiService.get(
        endpoint: "v1/api/coaches/$id",
        token: accessToken,
        refreshToken: refreshToken,
      );
      return Right(CoachResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
