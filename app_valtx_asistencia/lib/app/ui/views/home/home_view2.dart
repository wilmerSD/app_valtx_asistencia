import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/funtions/funtion_color_circle.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/details/bottomDetail.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/Contenido_week.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/appBar_home.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/bottom_home.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class HomeView2 extends StatelessWidget {
  const HomeView2({Key? key}) : super(key: key);

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
                       Container(
                          height: 80.0,
                          margin: EdgeInsets.only(
                              left: 10, right: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Obx((){
                              return controller.isLoading.value 
                              ? const CircularProgressIndicator()
                              : controller.responseUserAssistanceWeek.isEmpty
                                  ? Center(
                                      child: Text(
                                          '${controller.statusMessageUserInformation}'),
                                    )
                                  : ListTile(
                                      leading: const CircleAvatar(
                                          backgroundColor: Colors.red),
                                      title: Text(
                                          "${controller.responseUserInformation.value.names} ${controller.responseUserInformation.value.lastNames}"),
                                      subtitle: Row(
                                        children: [
                                          const Icon(
                                            Iconsax.location,
                                            color:
                                                Color.fromRGBO(38, 52, 113, 1),
                                          ),
                                          Text(
                                              "${controller.responseUserInformation.value.primaryAddress}"),
                                        ],
                                      ),
                                    );
                          }
                          )
                          
                  
                )],
                )
              ]),
            ));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AltMarcar());
  }
}
/* BtnMarcar(
                      OnTap: () {
                        controller.assistMarker();
                        _showAlertDialog(context);
                      },
                      title: 'Marcar',
                      color: const Color.fromARGB(255, 244, 129, 22),
                      sombra: const Color.fromARGB(255, 244, 129, 22),
                    )  */
