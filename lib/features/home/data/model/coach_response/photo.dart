import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final String? url;
  final String? secureUrl;

  const Photo({this.url, this.secureUrl});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json['url'] as String?,
        secureUrl: json['secure_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'secure_url': secureUrl,
      };

  @override
  List<Object?> get props => [url, secureUrl];
}
