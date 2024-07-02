import 'package:equatable/equatable.dart';

import 'photo.dart';

class Data extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? username;
  final String? role;
  final Photo? photo;
  final String? firstName;
  final String? lastName;
  final List<dynamic>? clients;
  final List<dynamic>? upComingMeetings;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? verifyCode;

  const Data({
    this.id,
    this.email,
    this.password,
    this.username,
    this.role,
    this.photo,
    this.firstName,
    this.lastName,
    this.clients,
    this.upComingMeetings,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.verifyCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        username: json['username'] as String?,
        role: json['role'] as String?,
        photo: json['photo'] == null
            ? null
            : Photo.fromJson(json['photo'] as Map<String, dynamic>),
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        clients: json['clients'] as List<dynamic>?,
        upComingMeetings: json['upComingMeetings'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        verifyCode: json['verifyCode'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
        'password': password,
        'username': username,
        'role': role,
        'photo': photo?.toJson(),
        'first_name': firstName,
        'last_name': lastName,
        'clients': clients,
        'upComingMeetings': upComingMeetings,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'verifyCode': verifyCode,
      };

  @override
  List<Object?> get props {
    return [
      id,
      email,
      password,
      username,
      role,
      photo,
      firstName,
      lastName,
      clients,
      upComingMeetings,
      createdAt,
      updatedAt,
      v,
      verifyCode,
    ];
  }
}
