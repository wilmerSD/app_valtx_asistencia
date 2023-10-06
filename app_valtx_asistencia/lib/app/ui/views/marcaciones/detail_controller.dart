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
  final _assistancesMonthUserRepository = Get.find<AssistanceMonthUserRepository>();
  final _assistancesDayUserRepository = Get.find<AssistanceDayUserRepository>();

  //variables
   var responseTypesValidations = <Datum>[].obs;
   var responseDataDia = <DatumDay>[].obs;
   var responseDataMes = <DatumMonth>[].obs;
   var statusDataMes = ''.obs;
   var userId = 1;
   var authToken= 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyYW5kb21EYXRhIjowLjcxOTc3NzQzODkzNjg4NzIsImV4cCI6MTY5NjM1MTU2NCwiaWF0IjoxNjk2MzQ3OTY0fQ.ep1yL-TmMsMo2ydZWf8MbreJvP8-gDkEp1lDVBQGHq8';
   
  
  //Funciones
  //Tipos de validacion
  void _typesValidationsuser() async {
    final response = await _typesValidationsRepository.getTypesValidations(
    );
    responseTypesValidations.assignAll((response.data));
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //Asistencias del mes de usuario
  void _assistancesMonthUser() async {
    final response = await _assistancesMonthUserRepository.getAssistancesMonth(
      RequestIdUserModel(
        idUser: 1
      ),
    );
     responseDataMes.assignAll(response.data);
    statusDataMes.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }
  
  //Asistencias del dia de usuario
  void _assistancesDayUser() async {
    final response = await _assistancesDayUserRepository.getAssistancesDay(
      RequestIdUserModel(
        idUser: 1
      ),
    );
  responseDataDia.assignAll(response.data);
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }
  /* void _optenerId() async {
      String value = await LocalStorageService.get(Keys.KeyUserAuth);
      final responseAuthModel = ResponseAuthModel.fromJson(json.decode(value));
      print("Usuario con id ${responseAuthModel.user?.id}");
      userId = responseAuthModel.user?.id ?? 0;
      print(userId);
    } */
  
  
}