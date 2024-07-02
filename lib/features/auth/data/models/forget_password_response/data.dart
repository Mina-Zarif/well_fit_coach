import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? from;
  final List<dynamic>? to;

  const Data({this.from, this.to});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        from: json['from'] as String?,
        to: json['to'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
      };

  @override
  List<Object?> get props => [from, to];
}
