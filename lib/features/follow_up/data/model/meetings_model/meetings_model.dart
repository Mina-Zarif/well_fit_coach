import 'package:equatable/equatable.dart';

import 'datum.dart';

class MeetingsModel extends Equatable {
  final int? code;
  final bool? success;
  final List<Datum>? data;
  final dynamic error;

  const MeetingsModel({this.code, this.success, this.data, this.error});

  factory MeetingsModel.fromJson(Map<String, dynamic> json) => MeetingsModel(
        code: json['code'] as int?,
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        error: json['error'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
        'error': error,
      };

  @override
  List<Object?> get props => [code, success, data, error];
}
