import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await _dio.post(
      endpoint,
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patch({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await _dio.patch(
      endpoint,
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? query,
    String? token,
    String? refreshToken,
  }) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
      'x-refresh-token': refreshToken,
    };
    var response = await _dio.get(
      endpoint,
      queryParameters: query ?? {},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
    String? refreshToken,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'x-refresh-token': refreshToken,
    };
    var response = await _dio.delete(
      endpoint,
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
    String? refreshToken,
    String? id,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'x-refresh-token': refreshToken,
    };
    var response = await _dio.put(endpoint, data: data, queryParameters: {
      "id": id,
    });
    return response.data;
  }
}
