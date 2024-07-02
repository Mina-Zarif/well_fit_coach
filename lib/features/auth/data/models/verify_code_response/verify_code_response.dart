import 'package:equatable/equatable.dart';

class VerifyCodeResponse extends Equatable {
  final int? code;
  final bool? success;
  final String? data;
  final String? id;
  final String? refreshToken;
  final String? accessToken;

  const VerifyCodeResponse({
    this.code,
    this.success,
    this.data,
    this.id,
    this.refreshToken,
    this.accessToken,
  });

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) {
    return VerifyCodeResponse(
      code: json['code'] as int?,
      success: json['success'] as bool?,
      data: json['data'] as String?,
      id: json['id'] as String?,
      refreshToken: json['refreshToken'] as String?,
      accessToken: json['accessToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'success': success,
        'data': data,
        'id': id,
        'refreshToken': refreshToken,
        'accessToken': accessToken,
      };

  @override
  List<Object?> get props {
    return [
      code,
      success,
      data,
      id,
      refreshToken,
      accessToken,
    ];
  }
}
