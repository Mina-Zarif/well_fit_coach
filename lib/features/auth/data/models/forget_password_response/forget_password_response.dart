import 'package:equatable/equatable.dart';

import 'data.dart';

class ForgetPassResponse extends Equatable {
  final int? code;
  final bool? success;
  final String? accepted;
  final Data? data;

  const ForgetPassResponse({
    this.code,
    this.success,
    this.accepted,
    this.data,
  });

  factory ForgetPassResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPassResponse(
      code: json['code'] as int?,
      success: json['success'] as bool?,
      accepted: json['accepted'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'success': success,
        'accepted': accepted,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [code, success, accepted, data];
}
