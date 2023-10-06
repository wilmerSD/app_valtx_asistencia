import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_day_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_month_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_week_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/register_marking_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_assistances_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_validations_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
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
  final _assistancesDayUser = Get.find<AssistanceDayUserRepository>();
  final _assistancesWeekUserRepository = Get.find<AssistanceWeekUserRepository>();
  final _assistancesMonthkUserRepository = Get.find<AssistanceMonthUserRepository>();
  final _registerMarkingUser = Get.find<RegisterMarkingUserRepository>();
  final _typesAssistances = Get.find<TypesAssistancesUserRepository>();
  final _typesValidations = Get.find<TypesValidationsRepository>();

  //Variable

  //TextEditingController

  //Functions
  //traer información del usuario
  /*void _initialize() async {
    final response = await _userRepository.getUserInformation(
      RequestUserInformationModel(
        username: await StorageService.get(Keys.kUserName),
        password: await StorageService.get(Keys.kPassword),
      ),
    );
    if (!response.success) {
      print("error 01: ${response.statusMessage}");
      return;
    }
  }*/

  //tipos de marcación
  // void _initialize() async {
  //   final response = await _typesAssistances.getTypesAssistances(
  //   );
  //
  //   if (!response.success) {
  //     print("error: ${response.statusMessage}");
  //     return;
  //   }
  // }

  //Tipos de validacion
  // void _initialize() async {
  //   final response = await _typesValidations.getTypesValidations(
  //   );

  //   if (!response.success) {
  //     print("error: ${response.statusMessage}");
  //     return;
  //   }
  // }

  // //Asistencias del dia
  // void _initialize() async {
  //   final response = await _assistancesDayUser.getAssistancesDay(
  //     RequestIdUserModel(
  //       idUser: 1
  //     ),
  //   );

  //   if (!response.success) {
  //     print("error: ${response.statusMessage}");
  //     return;
  //   }
  // }

  // //Asistencias del mes
  // void _initialize() async {
  //   final response = await _assistancesMonthkUserRepository.getAssistancesMonth(
  //     RequestIdUserModel(
  //       idUser: 1
  //     ),
  //   );

  //   if (!response.success) {
  //     print("error: ${response.statusMessage}");
  //     return;
  //   }
  // }

  //Asistencia de la semana
  // void _initialize() async {
  //   final response = await _assistancesWeekUserRepository.getAssistancesWeek(
  //     RequestIdUserModel(
  //       idUser: 1
  //     ),
  //   );

  //   if (!response.success) {
  //     print("error: ${response.statusMessage}");
  //     return;
  //   }
  // }

  //Registrar asistencia
  void _initialize() async {
    final response = await _registerMarkingUser.postRegisterMarking(
      RequestMarkingUserModel(
        idUser: 13,
        idTypesMarking: 1,
        latitude: -6.764219076343798,
        longitude:  -79.86364880389573
      ),
    );

    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }
  
  //Optener el id de usuario
/*   void _optenerId() async {
    String value = await LocalStorageService.get(Keys.KeyUserAuth);
    final responseAuthModel = ResponseAuthModel.fromJson(json.decode(value));
    print("Usuario con id ${responseAuthModel.user?.id}");
    userId = responseAuthModel.user?.id ?? 0;
    print(userId);
  }
   */
}
