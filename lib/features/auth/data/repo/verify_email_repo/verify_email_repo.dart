// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/features/auth/data/models/verify_code_response/verify_code_response.dart';
import 'package:well_fit_coach/features/auth/data/repo/verify_email_repo/verify_email_impl.dart';

class VerifyEmailRepoImpl implements VerifyEmailRepo {
  final ApiService apiService;

  VerifyEmailRepoImpl(this.apiService);

  @override
  Future<Either<Failure, VerifyCodeResponse>> verifyEmail(
      {required String pinCode, required String email}) async {
    try {
      var data = await apiService.get(
        endpoint: "v1/api/coaches/auth/mail",
        query: {
          "code": pinCode,
          "email": email,
        },
      );
      return Right(VerifyCodeResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
