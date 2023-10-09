import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_authentication_model.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_error.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/core/helpers/popup_message.dart';
import 'package:app_valtx_asistencia/routes/app_routes.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Instances
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  //Variables
  String userName = '';
  String password = '';
  RxString messageError = RxString("");
  RxBool isLoading = false.obs;
  //Functions
  void doAuth() async {
    try {
      final response = await _authenticationRepository.postAuthentication(
        RequestAuthenticationModel(
          username: userName,
          password: password,
        ),
      );
      isLoading.value = false;
      print("mensaje: ${response.statusMessage}");
      if (!response.success) {
        messageError.value = response.statusMessage;

        /* print("error: ${response.statusMessage}"); */
        return;
      }

      //Guardar la información en sesión
      await StorageService.set(
          key: Keys.kTokenSesion, value: response.data!.token);
      await StorageService.set(key: Keys.kUserName, value: userName);
      await StorageService.set(key: Keys.kPassword, value: password);
      print("token: ${response.data!.token}");
      //Ir a nueva ruta y eliminar de memoria controllers existentes
      Get.offNamed(AppRoutesName.HOME);
    } catch (error) {
      if (error is DioException) {
        print('ERROR: ${error.response?.data['message']}');
      } else {
        print('Error de conexión');
      }
    }
  }
}
