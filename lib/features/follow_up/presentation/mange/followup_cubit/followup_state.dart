import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/features/follow_up/data/model/meetings_model/meetings_model.dart';

abstract class FollowUpState {}

class FollowUpInitial extends FollowUpState {}

class GoToDayState extends FollowUpState {}

class LoadingState extends FollowUpState {}

class FailedFetchData extends FollowUpState {
  final Failure error;

  FailedFetchData({required this.error});
}

class SuccessFetchData extends FollowUpState {
  final MeetingsModel response;

  SuccessFetchData({required this.response});
}
