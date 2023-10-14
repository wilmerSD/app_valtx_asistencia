import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/dashed_line.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/content_week_home.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/appBar_home.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/bottom_home.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/map_view.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/user_information.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helpers = Helpers();
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              body: Stack(children: [
                const MapView(),
                Column(
                  children: [
                    //Detalles
                    const AppBarHome(),
                    Expanded(child: Container()),
                    //Asistencias de la semana
                    const ContentWeekHome(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //Información del usuario
                    const UserInformation(),
                    DashedLine(
                      dashWidth: 5.0,
                      dashGap: 5.0,
                      color: AppColors.grayLight,
                      width: double.infinity,
                      height: 1.0,
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    ),
                    const BottomHome(),
                    //Para marcar asistencia
                    BtnMarcar(
                      OnTap: () {
                        helpers.showTypesMarkingDialog(context, controller);
                        controller.getCurrentLocation();
                        controller.getNameLocation();
                      },
                      title: 'Marcar',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                )
              ]),
            ));
  }
}
