import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_authentication_model.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
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
  RxBool isVisible = false.obs;
  //Functions
  void doAuth() async {
    isLoading.value = true;
    try {
      final response = await _authenticationRepository.postAuthentication(
        RequestAuthenticationModel(
          username: userName,
          password: password,
        ),
      );
      isLoading.value = false;
      messageError.value = response.statusMessage;
      print("mensaje: ${response.statusMessage}");
      if (!response.success) {
        isVisible.value = true;
        Get.forceAppUpdate();
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
      isLoading.value = false;
      isVisible.value = true;
      if (error is DioException) {
        print('ERROR: ${error.response?.data['message']}');
        messageError.value='Error En el servidor';
      } else {
         messageError.value='Error de conexiónnnnnnnnnnnnn';
        print('Error de conexiónnnnnnnnnnnnn');
      }
    }
  }
}
