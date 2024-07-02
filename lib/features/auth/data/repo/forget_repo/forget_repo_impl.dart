// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/features/auth/data/models/forget_password_response/forget_password_response.dart';
import 'package:well_fit_coach/features/auth/data/repo/forget_repo/forget_repo.dart';

class ForgetRepoImpl implements ForgetRepo {
  final ApiService apiService;

  ForgetRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ForgetPassResponse>> forgetPassword(
      {required String email}) async {
    try {
      var data = await apiService.patch(
        endpoint: "v1/api/coaches/auth/coach",
        data: {
          "email": email,
        },
      );
      return Right(ForgetPassResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
