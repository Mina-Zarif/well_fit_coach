// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/features/auth/data/models/token_model/token_model.dart';
import 'package:well_fit_coach/features/auth/data/models/update_password/update_password.dart';
import 'package:well_fit_coach/features/auth/data/repo/set_password_repo/set_password_repo.dart';

class SetPasswordImpl implements SetPasswordRepo {
  final ApiService apiService;

  SetPasswordImpl(this.apiService);

  @override
  Future<Either<Failure, UpdatePassword>> setNewPassword(
      {required String password, required TokenModel tokenModel}) async {
    try {
      var data = await apiService.put(
        endpoint: "v1/api/coaches",
        data: {
          "password": password,
        },
        token: tokenModel.accessToken,
        refreshToken: tokenModel.refreshToken,
        id: tokenModel.id,
      );
      return Right(UpdatePassword.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
