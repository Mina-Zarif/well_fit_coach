// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/features/auth/data/models/login_request/login_request.dart';
import 'package:well_fit_coach/features/auth/data/models/login_response/login_response.dart';
import 'package:well_fit_coach/features/auth/data/repo/login_repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      var data = await apiService.post(
        endpoint: "v1/api/coaches/auth/coach",
        data: loginRequest.toJson(),
      );
      return Right(LoginResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
