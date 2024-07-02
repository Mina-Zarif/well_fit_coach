import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/features/home/data/model/coach_response/coach_response.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeSetState extends HomeState {}

class LoadingHomeData extends HomeState {}

class SuccessFetchData extends HomeState {
  final CoachResponse response;

  SuccessFetchData({required this.response});
}

class FailedFetchData extends HomeState {
  final Failure error;

  FailedFetchData({required this.error});
}
