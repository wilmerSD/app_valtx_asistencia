import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_authentication_model.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //Instance
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  //Variable
  String userName = "wilmer@gmail.com";
  String password = "123456";

  //TextEditingController

  //Function
  void _initialize() async {
    final response = await _authenticationRepository.postAuthentication(
      RequestAuthenticationModel(
        username: userName,
        password: password,
      ),
    );

    if (response.success) {
      print("error: ${response.statusMessage}");
      return;
    }

    //Guardar la información en sesión
    await StorageService.set(key: Keys.kTokenSesion, value: response.data!.token);
    await StorageService.set(key: Keys.kUserName, value: userName);
    await StorageService.set(key: Keys.kPassword, value: password);
    
    //Ir a nueva ruta y eliminar de memoria controllers existentes
    Get.offNamed(AppRoutesName.HOME);

  }
}
