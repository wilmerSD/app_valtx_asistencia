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
  String userName = "";
  String password = "";
  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;
  RxString messageError = RxString("");

  //TextEditingController

  //Function

  void _initialize() async {
    final userName = await StorageService.get(Keys.kUserName);
    final password = await StorageService.get(Keys.kPassword);

    if (userName.isNotEmpty && password.isNotEmpty) {
      final response = await _authenticationRepository.postAuthentication(
        RequestAuthenticationModel(
          username: userName,
          password: password,
        ),
      );

      if (response.success) {
        await StorageService.set(
            key: Keys.kTokenSesion, value: response.data!.token);
        Future.delayed(
          const Duration(milliseconds: 600),
          () {
            Get.offNamed(AppRoutesName.HOME);
          },
        );
      } else {
        Get.offNamed(AppRoutesName.LOGIN);
      }
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offNamed(AppRoutesName.LOGIN);
      });
    }
  }
}
