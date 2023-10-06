import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_day_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_month_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_week_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/register_marking_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_assistances_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    _getinformationUser();
    _getTypesMarking();

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
  Location location = Location();
  LocationData? locationData;
  final _userRepository = Get.find<UserRepository>();
  final _assistancesWeekUserRepository =
      Get.find<AssistanceWeekUserRepository>();
  final _assistancesMonthkUserRepository =
      Get.find<AssistanceMonthUserRepository>();
  final _registerMarkingUser = Get.find<RegisterMarkingUserRepository>();
  final _typesAssistances = Get.find<TypesAssistancesUserRepository>();

  //Variables
  var myPosition2 = const LatLng(-12.086733751659768, -76.99129060428967);
  //var myPosition = LatLng(0, 0);
  Rx<LatLng> myPosition =
      Rx<LatLng>(LatLng(-6.7638751891380995, -79.86384501573184));
  int userId = 0;
  var responseUserInformation = <Data>[].obs;
  var responseTypesMarking = 
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
  /* int cantidadF = 0;
  int cantidadT = 0;
  int cantidadJ = 0;
  double latitude = 0.0;
  double longitude = 0.0; */

  //Functions
  //traer información del usuario
  void _getinformationUser() async {
    final response = await _userRepository.getUserInformation(
      RequestUserInformationModel(
        username: await StorageService.get(Keys.kUserName),
        password: await StorageService.get(Keys.kPassword),
      ),
    );
    responseUserInformation.assignAll(response.data);
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //tipos de marcación
  void _getTypesMarking() async {
    final response = await _typesAssistances.getTypesAssistances(
    );

    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }
  

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
          longitude: -79.86364880389573),
    );

    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  void _obtenerUbicacion() async {
    try {
      LocationData userLocation = await location.getLocation();
      latitude.value = userLocation.latitude ?? 0.0;
      longitude.value = userLocation.longitude ?? 0.0;
      lat = latitude.value;
      long = longitude.value;

      /* latitude = userLocation.latitude ?? 0.0;
      longitude = userLocation.longitude ?? 0.0; */
      /* myPosition.value = LatLng(latitude.value, longitude.value); */
      /* myPosition = LatLng(latitude.value, longitude.value); */
      print('esta es la latitud------${latitude}');
      /* myPosition.value = LatLng(latitude.value, longitude.value); */
      myPosition.value = LatLng(lat, long);
      cantidadF += 1;
      update();
      print('mi posicion es: ${myPosition.value}');
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir al obtener la ubicación.
      print('Error al obtener la ubicación: $e');
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
