import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
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
                    const UserInformation(),

                    //Para marcar asistencia
                    BtnMarcar(
                      OnTap: () {
                        _showTypesMarkingDialog(context, controller);
                        //_showAlertDialog(context);
                      },
                      title: 'Marcar',
                      color: const Color.fromARGB(255, 244, 129, 22),
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
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.responseUserAssistanceWeek.isEmpty
                ? Center(
                    child: Text('${controller.statusMessageTypesMarking}'),
                  )
                : AlertDialog(
                    title: Text('Seleccionar tipo de marcación'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: controller.responseTypesMarking.map((type) {
                        return ListTile(
                          title: Text(type
                              .description), // Supongo que los tipos tienen un atributo 'name'
                          onTap: () {
                            // Aquí puedes realizar la acción correspondiente al tipo de marcación seleccionado
                            Navigator.pop(context,
                                type.idTypesMarking); // Cierra el diálogo y devuelve el valor del tipo (por ejemplo, type.id)
                          },
                        );
                      }).toList(),
                    ),
                  );
      },
    ).then((selectedValue) {
      // El valor seleccionado se encuentra en selectedValue
      
      if (selectedValue != null) {
        controller.assistMarker(selectedValue);
        controller.isLoading.value 
        ? const Center(child: CircularProgressIndicator())
            : controller.responseUserAssistanceWeek.isEmpty
                ? Center(
                    child: AlertDialog(
    title: Text('Mensaje de Alerta'),
    content: Text('${controller.statusMessageUserAssistance}'),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          // Cierra la alerta
          Navigator.of(context).pop();
        },
        child: Text('Aceptar'),
      ),
    ],
  ),
                  )
                : _showAlertDialog;
        print('Tipo de marcación seleccionado: $selectedValue');
        // Aquí puedes llamar a otras funciones o realizar acciones adicionales según el tipo seleccionado
      }
    });
  }
}
