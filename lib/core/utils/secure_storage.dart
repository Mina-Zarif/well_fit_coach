import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:well_fit_coach/features/auth/data/models/token_model/token_model.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final String idKey = 'id';
  final String accessTokenKey = 'access_token';
  final String refreshTokenKey = 'refresh_token';

  writeSecureData({
    required String id,
    required String accessToken,
    required String refreshToken,
  }) async {
    await storage.write(key: idKey, value: id);
    await storage.write(key: accessTokenKey, value: accessToken);
    await storage.write(key: refreshTokenKey, value: refreshToken);
  }

  Future<TokenModel?> readSecureData() async {
    // await storage.read(key: key);
    TokenModel tokenModel = TokenModel(
      id: await storage.read(key: idKey),
      refreshToken: await storage.read(key: refreshTokenKey),
      accessToken: await storage.read(key: accessTokenKey),
    );
    return tokenModel;
  }

  deleteSecureData() async {
    await storage.delete(key: idKey);
    await storage.delete(key: accessTokenKey);

    await storage.delete(key: refreshTokenKey);
  }
}
