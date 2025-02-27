import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await remoteDataSource.signUp(email: email, password: password);
    } catch (e) {
      throw Exception('Error signing up: ${e.toString()}');
    }
  }
}
