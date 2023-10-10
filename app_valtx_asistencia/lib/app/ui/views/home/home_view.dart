import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/dashed_line.dart';
import 'package:app_valtx_asistencia/app/ui/components/funtions/funtion_color_circle.dart';
import 'package:app_valtx_asistencia/app/ui/components/types_assistances.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/details/bottomDetail.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/Contenido_week.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/appBar_home.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/bottom_home.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/user_information.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              body: Stack(children: [
                Obx(() {
                  return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: controller.currentLocation.value,
                      zoom: 100.0,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('current_location'),
                        position: controller.currentLocation.value,
                      ),
                    },
                  );
                }),
                Column(
                  children: [
                    //Detalles
                    const AppBarHome(),
                    Expanded(child: Container()),
                    //Asistencias de la semana
                    const ContenidoWeek(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //Información del usuario
                    const UserInformation(),
                    DashedLine(
                      dashWidth: 5.0,
                      dashGap: 5.0,
                      color: Colors.grey,
                      width: double.infinity,
                      height: 1.0,
                      margin: EdgeInsets.only(left: 10.0, right: 15.0),
                    ),
                    const BottomHome(),
                    //Para marcar asistencia
                    BtnMarcar(
                      OnTap: () {
                        _showTypesMarkingDialog(context, controller);
                        controller.getCurrentLocation();
                      },
                      title: 'Marcar',
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 244, 129, 22), // Color inicial
                          Color.fromARGB(255, 255, 87, 34), // Color final
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment
                            .bottomCenter, // Ajusta el final a la derecha
                        // Ajusta el desplazamiento del degradado si es necesario
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      sombra: const Color.fromARGB(255, 244, 129, 22),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                )
              ]),
            ));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AltMarcar());
  }

  // Definición de la función para mostrar el diálogo de tipos de marcación
  void _showTypesMarkingDialog(
      BuildContext context, HomeController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
            // Define un tema personalizado para el diálogo
            data: ThemeData(
              // Establece el color de fondo deseado (por ejemplo, blanco)
              dialogBackgroundColor: Colors.white,
            ),
            child: controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.responseUserAssistanceWeek.isEmpty
                    ? Center(
                        child: Text('${controller.statusMessageTypesMarking}'),
                      )
                    : AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Ajusta el radio según tus preferencias
                        ),
                        backgroundColor: Colors.white,
                        title: const Text('Seleccionar tipo de marcación'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: controller.responseTypesMarking.map((type) {
                            return ListTile(
                              title: Text(type.description),
                              onTap: () {
                                Navigator.pop(context, type.idTypesMarking);
                              },
                            );
                          }).toList(),
                        ),
                      ));
      },
    ).then((selectedValue) {
      if (selectedValue != null) {
        controller.assistMarker(selectedValue);
        Future.delayed(const Duration(seconds: 2), () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: const Text('Información de asistencia'),
                content: Text('${controller.statusMessageUserAssistance}'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Aceptar'),
                  ),
                ],
              );
            },
          );
        });
      }
    });
  }
}
