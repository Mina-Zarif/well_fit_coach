import 'package:dartz/dartz.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/features/follow_up/data/model/meetings_model/meetings_model.dart';

abstract class MeetingsRepo {
  Future<Either<Failure, MeetingsModel>> fetchMeetings({
    required String id,
    required String accessToken,
    required String refreshToken,
  });
}
