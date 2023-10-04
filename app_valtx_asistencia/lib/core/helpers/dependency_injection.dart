import 'package:app_valtx_asistencia/app/providers/authentication_provider.dart';
import 'package:app_valtx_asistencia/app/providers/user_provider.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void initialize() {
    //NETWORK
    Get.lazyPut<DioClient>(() => DioClient(), fenix: true);

    //STORAGE
    Get.lazyPut<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
      fenix: true,
    );

    //HIVE

    //PROVIDERS
    Get.lazyPut<AuthenticationProvider>(
      () => AuthenticationProvider(),
      fenix: true,
    );

    Get.lazyPut<UserProvider>(
      () => UserProvider(),
      fenix: true,
    );

    //REPOSITORIES
    Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepository(),
      fenix: true,
    );

    Get.lazyPut<UserRepository>(
      () => UserRepository(),
      fenix: true,
    );
  }
}
