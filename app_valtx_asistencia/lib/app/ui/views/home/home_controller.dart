import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
    super.onClose();
  }

  //Instance
  final _userRepository = Get.find<UserRepository>();

  //Variable

  //TextEditingController

  //Function
  void _initialize() async {
    final response = await _userRepository.getUserInformation(
      RequestUserInformationModel(
        username: await StorageService.get(Keys.kUserName),
        password: await StorageService.get(Keys.kPassword),
      ),
    );

    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }
}
