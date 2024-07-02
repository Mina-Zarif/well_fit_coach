import 'package:equatable/equatable.dart';

import 'data.dart';

class UpdatePassword extends Equatable {
  final int? code;
  final bool? success;
  final Data? data;
  final dynamic error;

  const UpdatePassword({this.code, this.success, this.data, this.error});

  factory UpdatePassword.fromJson(Map<String, dynamic> json) {
    return UpdatePassword(
      code: json['code'] as int?,
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'success': success,
        'data': data?.toJson(),
        'error': error,
      };

  @override
  List<Object?> get props => [code, success, data, error];
}
