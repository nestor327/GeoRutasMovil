abstract class AuthRepository {
  Future<void> signUp({required String email, required String password});
}
