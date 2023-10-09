import 'package:app_valtx_asistencia/app/ui/components/funtions/funtion_color_circle.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/Contenido_week.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/appBar_home.dart';
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
                const AppBarHome(),
                const ContenidoWeek(),
                
              ]),
            ));
  }
}
