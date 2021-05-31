import 'package:get_it/get_it.dart';
import 'package:secure_notes/feature/auth/auth_model.dart';
import 'package:secure_notes/feature/auth/auth_model_repository.dart';
import 'package:secure_notes/utils/di.dart';

class AuthModule implements DiModule {
  @override
  Future<void> register(GetIt serviceLocator) async {
    serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  }
}
