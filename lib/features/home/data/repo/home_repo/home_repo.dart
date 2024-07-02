import 'package:dartz/dartz.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/features/home/data/model/coach_response/coach_response.dart';

abstract class HomeRepo {
  Future<Either<Failure, CoachResponse>> fetchHomeData({
    required String id,
    required String accessToken,
    required String refreshToken,
  });
}
