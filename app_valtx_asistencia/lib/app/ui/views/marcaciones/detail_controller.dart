import 'dart:convert';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_day_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_day_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_month_user_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_validations_model.dart';
import 'package:app_valtx_asistencia/app/repositories/types_validations_repository.dart';

import 'package:get/get.dart';

class DetailController extends GetxController {
  @override
  void onInit() {
    _typesValidationsuser();
    _assistancesDayUser();
    _assistancesMonthUser();
    
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
  final _typesValidationsRepository = Get.find<TypesValidationsRepository>();
  final _assistancesMonthUserRepository =
      Get.find<AssistanceMonthUserRepository>();
  final _assistancesDayUserRepository = Get.find<AssistanceDayUserRepository>();

  //variables
  var responseTypesValidations = <Datum>[].obs;
  var responseDataDia = <DatumDay>[].obs;
  var responseDataMes = <DatumMonth>[].obs;
  var statusMessageDay = ''.obs;
  var statusMessageMonth = ''.obs;
  RxBool isLoading = false.obs;
  

  //Funciones
  //Tipos de validacion
  void _typesValidationsuser() async {
    isLoading.value = true;
    final response = await _typesValidationsRepository.getTypesValidations();
    responseTypesValidations.assignAll((response.data));
    isLoading.value = false;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //Asistencias del mes de usuario
  void _assistancesMonthUser() async {
    isLoading.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    final response = await _assistancesMonthUserRepository.getAssistancesMonth(
      RequestIdUserModel(idUser: int.parse(Iduser),),
    );
    isLoading.value = false;
    responseDataMes.assignAll(response.data ?? []);
    statusMessageMonth.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }


  //Asistencias del dia de usuario
  void _assistancesDayUser() async {
    isLoading.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    final response = await _assistancesDayUserRepository.getAssistancesDay(
      RequestIdUserModel(idUser: int.parse(Iduser),),
    );
    isLoading.value = false;
    responseDataDia.assignAll(response.data ?? []);
    statusMessageDay.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }
}
