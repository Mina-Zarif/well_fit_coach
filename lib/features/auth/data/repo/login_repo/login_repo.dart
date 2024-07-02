import 'package:dartz/dartz.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/features/auth/data/models/login_request/login_request.dart';
import 'package:well_fit_coach/features/auth/data/models/login_response/login_response.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginRequest});
}
