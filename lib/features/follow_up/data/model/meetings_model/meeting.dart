import 'package:equatable/equatable.dart';

class Meeting extends Equatable {
  final String? id;
  final DateTime? date;
  final String? status;
  final String? url;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Meeting({
    this.id,
    this.date,
    this.status,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
        id: json['_id'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        status: json['status'] as String?,
        url: json['url'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'date': date?.toIso8601String(),
        'status': status,
        'url': url,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      date,
      status,
      url,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
