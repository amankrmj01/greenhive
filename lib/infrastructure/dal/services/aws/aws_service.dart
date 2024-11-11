import 'package:get_it/get_it.dart';
import 'sign_in_service.dart';
import 'sign_up_service.dart';
import 'sign_out_service.dart';
import 'session_service.dart';

final GetIt getIt = GetIt.instance;

class AWSServiceC {
  static void setupServiceLocator() {
    // Register SecureStorageInterface
    // DependencyManager.instance
    //     .registerBuilder<SecureStorageInterface>(() => SecureStorage());
    // print('SecureStorageInterface registered successfully');

    // Register other dependencies
    // getIt.registerSingleton<AmplifyAuthCognito>(AmplifyAuthCognito());
    getIt.registerSingleton<SignInService>(SignInService());
    getIt.registerSingleton<SignUpService>(SignUpService());
    getIt.registerSingleton<SignOutService>(SignOutService());
    getIt.registerSingleton<SessionService>(SessionService());
  }
}

// class DependencyManager {
//   static final DependencyManager _instance = DependencyManager._internal();
//   final Map<Type, dynamic Function()> _builders = {};
//
//   DependencyManager._internal();
//
//   factory DependencyManager() {
//     return _instance;
//   }
//
//   static DependencyManager get instance => _instance;
//
//   void registerBuilder<T>(dynamic Function() builder) {
//     _builders[T] = builder;
//   }
//
//   T get<T>() {
//     if (!_builders.containsKey(T)) {
//       throw StateError('No builder registered for type $T');
//     }
//     return _builders[T]!() as T;
//   }
// }
