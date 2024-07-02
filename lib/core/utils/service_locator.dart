import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: 'https://well-fit.onrender.com/',
          receiveDataWhenStatusError: true,
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      ),
    ),
  );
}
