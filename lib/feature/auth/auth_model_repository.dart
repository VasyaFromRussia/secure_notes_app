import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:secure_notes/feature/auth/auth_model.dart';
import 'package:secure_notes/utils/crypto.dart';

class AuthRepositoryImpl implements AuthRepository {
  static const _keyPasswordHash = 'password_hash';

  final _storage = new FlutterSecureStorage();

  @override
  Future<bool> hasCredentials() => _storage.containsKey(key: _keyPasswordHash);

  @override
  Future<bool> signIn(String password) async {
    final storedKey = await getKey();
    return password.sha1 == storedKey;
  }

  @override
  Future<void> signUp(String password) => _storage.write(key: _keyPasswordHash, value: password.sha1);

  @override
  Future<String?> getKey() => _storage.read(key: _keyPasswordHash);

  @override
  Future<void> signOut() => _storage.deleteAll();
}
