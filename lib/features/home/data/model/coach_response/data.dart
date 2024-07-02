import 'package:equatable/equatable.dart';

import 'photo.dart';

class Data extends Equatable {
  final String? id;
  final String? email;
  final String? username;
  final String? firstName;
  final String? lastName;
  final int? clients;
  final Photo? photo;
  final int? upComingMeetings;

  const Data({
    this.id,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.clients,
    this.photo,
    this.upComingMeetings,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        email: json['email'] as String?,
        username: json['username'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        clients: json['clients'] as int?,
        photo: json['photo'] == null
            ? null
            : Photo.fromJson(json['photo'] as Map<String, dynamic>),
        upComingMeetings: json['upComingMeetings'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'clients': clients,
        'photo': photo?.toJson(),
        'upComingMeetings': upComingMeetings,
      };

  @override
  List<Object?> get props {
    return [
      id,
      email,
      username,
      firstName,
      lastName,
      clients,
      photo,
      upComingMeetings,
    ];
  }
}
