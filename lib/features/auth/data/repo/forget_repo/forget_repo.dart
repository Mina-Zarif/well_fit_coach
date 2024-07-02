import 'package:dartz/dartz.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/features/auth/data/models/forget_password_response/forget_password_response.dart';

abstract class ForgetRepo {
  Future<Either<Failure, ForgetPassResponse>> forgetPassword(
      {required String email});
}
