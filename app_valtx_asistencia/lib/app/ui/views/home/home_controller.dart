import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_week_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_register_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_assistances_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_month_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_week_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/register_marking_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_assistances_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/routes/app_routes.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as locations;
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeController extends GetxController {
  @override
  void onInit() {
    _getinformationUser();
    _getTypesMarking();
    _getAssistancesMonthUser();
    _getAssistancesWeekhUser(); 
    _checkLocationPermission();
    super.onInit();
    update();
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
  locations.Location location =locations.Location();
  locations.LocationData? locationData; 
  final _userRepository = Get.find<UserRepository>();
  final _assistancesWeekUserRepository =
      Get.find<AssistanceWeekUserRepository>();
  final _assistancesMonthkUserRepository =
      Get.find<AssistanceMonthUserRepository>();
  final _registerMarkingUser = Get.find<RegisterMarkingUserRepository>();
  final _typesAssistances = Get.find<TypesAssistancesUserRepository>();

  //Variables
  var responseUserInformation = DataUser().obs;
  var responseTypesMarking =  <DatumAssistances>[].obs;
  var statusMessageTypesMarking = ''.obs;
  var statusMessageUserInformation = ''.obs;
  var statusMessageWeek = ''.obs;
  var statusMessageMonth = ''.obs;
  var responseUserAssistanceWeek = <DatumWeek>[].obs;
  var responseUserAssistanceMonth = <DatumMonth>[].obs;
  var responseUserAssistance = <DataMark>[].obs;
  var statusMessageUserAssistance = ''.obs;
  final LatLng initialPosition = LatLng(0, 0); // Ubicación inicial en latitud y longitud.
  final Rx<LatLng> currentLocation = Rx<LatLng>(LatLng(0, 0));
  RxBool isLoading = false.obs;
  int userId = 0;
  String username = '';
  String password = '';
  String token = '';

  //Functions
  //traer información del usuario
  void _getinformationUser() async {
    isLoading.value = true;
    final response = await _userRepository.getUserInformation(
      RequestUserInformationModel(
        username: await StorageService.get(Keys.kUserName),
        password: await StorageService.get(Keys.kPassword),
      ),
    );
    isLoading.value = false;
    responseUserInformation.value = response.data;
    statusMessageUserInformation.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
    final idUser = response.data.idUser;
    await StorageService.set(key: Keys.kIdUser, value: idUser.toString());
  }

  //tipos de marcación
  void _getTypesMarking() async {
    isLoading.value = true;
    final response = await _typesAssistances.getTypesAssistances(
    );
    isLoading.value = false;
    responseTypesMarking.assignAll(response.data);
    statusMessageTypesMarking.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  // //Asistencias del mes
  void _getAssistancesMonthUser() async {
    isLoading.value = true;
    final response = await _assistancesMonthkUserRepository.getAssistancesMonth(
      RequestIdUserModel(
        idUser: 1
      ),
    );
    isLoading.value = false;
    responseUserAssistanceMonth.assignAll(response.data??[]);
    statusMessageMonth.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //Asistencia de la semana
  void _getAssistancesWeekhUser() async {
    isLoading.value = true;
    final response = await _assistancesWeekUserRepository.getAssistancesWeek(
      RequestIdUserModel(
        idUser: 1
      ),
    );
    isLoading.value = false;
    responseUserAssistanceWeek.assignAll(response.data??[]);
    statusMessageWeek.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //Registrar asistencia
  void assistMarker(int selectedValue) async {
    isLoading.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    final response = await _registerMarkingUser.postRegisterMarking(
      RequestMarkingUserModel(
          idUser: int.parse(Iduser),
          idTypesMarking: selectedValue,
          latitude: -6.764219076343798,
          longitude: -79.86364880389573),
    );
    responseUserAssistance.assign(response.data);
    statusMessageUserAssistance.value = response.statusMessage;
    isLoading.value = false;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

   

Future<void> _checkLocationPermission() async {
    final hasPermission = await location.hasPermission();
    if (hasPermission == locations.PermissionStatus.denied) {
      final requestPermission = await location.requestPermission();
      if (requestPermission != locations.PermissionStatus.granted) {
        // El usuario ha denegado los permisos de ubicación.
        // Puedes mostrar un mensaje de error o solicitar permisos nuevamente.
        return;
      }
    }
    _getCurrentLocation();
  }

Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLocation.value = LatLng(position.latitude, position.longitude);
  }

  void navigateToScreen() {
    Get.toNamed(AppRoutesName.DETAIL);
  }
   
}
