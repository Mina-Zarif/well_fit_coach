import 'package:dartz/dartz.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/features/auth/data/models/verify_code_response/verify_code_response.dart';

abstract class VerifyEmailRepo {
  Future<Either<Failure, VerifyCodeResponse>> verifyEmail(
      {required String pinCode, required String email});
}
