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
  var responseUserInformation = DataUser();
  var responseTypesMarking =  <DatumAssistances>[];
  var statusMessageTypesMarking = ''.obs;
  var statusMessageUserInformation = ''.obs;
  var statusMessageWeek = ''.obs;
  var statusMessageMonth = ''.obs;
  var responseUserAssistanceWeek = <DatumWeek>[].obs;
  var responseUserAssistanceMonth = <DatumMonth>[].obs;
  var myPosition2 = const LatLng(-12.086733751659768, -76.99129060428967);
  Rx<LatLng> myPosition =
      Rx<LatLng>(LatLng(-6.7638751891380995, -79.86384501573184));
  int userId = 0;
  String messageMarca = '';
  RxInt cantidadF = RxInt(0);
  RxInt cantidadT = RxInt(0);
  RxInt cantidadJ = RxInt(0);
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  double lat = 0.0;
  double long = 0.0;
  String username = '';
  String password = '';
  String token = '';

  //Functions
  //traer información del usuario
  void _getinformationUser() async {
    final response = await _userRepository.getUserInformation(
      RequestUserInformationModel(
        username: await StorageService.get(Keys.kUserName),
        password: await StorageService.get(Keys.kPassword),
      ),
    );
    responseUserInformation = response.data;
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
    final response = await _typesAssistances.getTypesAssistances(
    );
    responseTypesMarking.assignAll(response.data);
    statusMessageTypesMarking.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  // //Asistencias del mes
  void _getAssistancesMonthUser() async {
    final response = await _assistancesMonthkUserRepository.getAssistancesMonth(
      RequestIdUserModel(
        idUser: 1
      ),
    );
    responseUserAssistanceMonth.assignAll(response.data??[]);
    statusMessageMonth.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //Asistencia de la semana
  void _getAssistancesWeekhUser() async {
    final response = await _assistancesWeekUserRepository.getAssistancesWeek(
      RequestIdUserModel(
        idUser: 1
      ),
    );
    responseUserAssistanceWeek.assignAll(response.data??[]);
    statusMessageWeek.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //Registrar asistencia
  void _assistMarker() async {
    String Iduser = await StorageService.get(Keys.kIdUser);
    final response = await _registerMarkingUser.postRegisterMarking(
      RequestMarkingUserModel(
          idUser: int.parse(Iduser),
          idTypesMarking: 1,
          latitude: -6.764219076343798,
          longitude: -79.86364880389573),
    );
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

/*   void obtenerUbicacion() async {
    try {
      LocationData userLocation = await location.getLocation();
      latitude.value = userLocation.latitude ?? 0.0;
      longitude.value = userLocation.longitude ?? 0.0;
      lat = latitude.value;
      long = longitude.value;
      print('esta es la latitud------${latitude}');
      myPosition.value = LatLng(lat, long);
      cantidadF += 1;
      update();
      print('mi posicion es: ${myPosition.value}');
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir al obtener la ubicación.
      print('Error al obtener la ubicación: $e');
    }
  } */
   final LatLng initialPosition = LatLng(0, 0); // Ubicación inicial en latitud y longitud.
  final Rx<LatLng> currentLocation = Rx<LatLng>(LatLng(0, 0));

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
