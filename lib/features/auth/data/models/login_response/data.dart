import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? id;
  final String? username;
  final String? email;
  final int? clients;
  final int? upComingMeetings;

  const Data({
    this.id,
    this.username,
    this.email,
    this.clients,
    this.upComingMeetings,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        clients: json['clients'] as int?,
        upComingMeetings: json['upComingMeetings'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'email': email,
        'clients': clients,
        'upComingMeetings': upComingMeetings,
      };

  @override
  List<Object?> get props {
    return [
      id,
      username,
      email,
      clients,
      upComingMeetings,
    ];
  }
}
