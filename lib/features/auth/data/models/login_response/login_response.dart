import 'package:equatable/equatable.dart';

import 'data.dart';

class LoginResponse extends Equatable {
  final int? code;
  final bool? success;
  final Data? data;
  final String? refreshToken;
  final String? accessToken;

  const LoginResponse({
    this.code,
    this.success,
    this.data,
    this.refreshToken,
    this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json['code'] as int?,
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        refreshToken: json['refreshToken'] as String?,
        accessToken: json['accessToken'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'success': success,
        'data': data?.toJson(),
        'refreshToken': refreshToken,
        'accessToken': accessToken,
      };

  @override
  List<Object?> get props {
    return [
      code,
      success,
      data,
      refreshToken,
      accessToken,
    ];
  }
}
