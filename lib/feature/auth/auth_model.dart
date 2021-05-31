abstract class AuthRepository {
  Future<bool> hasCredentials();

  Future<void> signUp(String password);

  Future<bool> signIn(String password);

  Future<String?> getKey();

  Future<void> signOut();
}
