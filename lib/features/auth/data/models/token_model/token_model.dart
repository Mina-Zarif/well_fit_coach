class TokenModel {
  String? id;
  String? accessToken;
  String? refreshToken;

  TokenModel({
    this.id,
    this.accessToken,
    this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        id: json['id'] as String?,
        accessToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
      );

  Map<String, dynamic> toJson() =>
      {'id': id, 'accessToken': accessToken, 'refreshToken': refreshToken};
}
