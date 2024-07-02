// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

abstract class Failure {
  final String? errMessage;

  const Failure({
    this.errMessage,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return const ServerFailure(
          errMessage: "Connection Timeout",
        );
      case DioErrorType.sendTimeout:
        return const ServerFailure(errMessage: "Send Timeout");
      case DioErrorType.receiveTimeout:
        return const ServerFailure(errMessage: "Receive Timeout");
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioError.response!.statusCode!,
          response: dioError.response!.data!,
        );
      case DioErrorType.cancel:
        return const ServerFailure(
            errMessage: 'Request to ApiServer was canceled');
      case DioErrorType.connectionError:
        return const ServerFailure(errMessage: "Connection Error");
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return const ServerFailure(errMessage: 'No Internet Connection');
        }
        return const ServerFailure(
            errMessage: 'Unexpected Error, Please try again!');
      default:
        return const ServerFailure(
            errMessage: 'Ops There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(
      {required int? statusCode, required dynamic response}) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 404 ||
        statusCode == 500 ||
        statusCode == 409) {
      print(response.toString());
      return ServerFailure(
        errMessage: response['error'],
      );
    } else {
      return const ServerFailure(
        errMessage: 'Oops, Unexpected error occurred, Please try again later',
      );
    }
  }
}
