import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static final LocalStorage localStorage = LocalStorage._();

  LocalStorage._();

  final _storage = const FlutterSecureStorage();

  Future<String?> getToken() async => await _storage.read(key: 'token');

  Future<void> deleteToken() async => await _storage.delete(key: 'token');

  Future<void> setToken(String token) async =>
      await _storage.write(key: 'token', value: token);
}
