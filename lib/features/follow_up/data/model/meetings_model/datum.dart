import 'package:equatable/equatable.dart';

import 'meeting.dart';

class Datum extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final Meeting? meeting;

  const Datum({this.id, this.firstName, this.lastName, this.meeting});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        meeting: json['meeting'] == null
            ? null
            : Meeting.fromJson(json['meeting'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'meeting': meeting?.toJson(),
      };

  @override
  List<Object?> get props => [id, firstName, lastName, meeting];
}
