import 'package:dartz/dartz.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/features/auth/data/models/token_model/token_model.dart';
import 'package:well_fit_coach/features/auth/data/models/update_password/update_password.dart';

abstract class SetPasswordRepo {
  Future<Either<Failure, UpdatePassword>> setNewPassword(
      {required String password, required TokenModel tokenModel});
}
