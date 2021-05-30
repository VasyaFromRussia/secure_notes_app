abstract class AuthRepository {
  Stream<bool> listenAuthorizationState();

  Future<void> signUp(String password);

  Future<void> signIn(String password);

  Future<String> getKey();
}
