import 'package:get_it/get_it.dart';

abstract class DiModule {
  Future<void> register(GetIt serviceLocator);
}

T inject<T extends Object>([String? name]) => GetIt.instance.get<T>(instanceName: name);

Future<T> injectAsync<T extends Object>([String? name]) => GetIt.instance.getAsync<T>(instanceName: name);
