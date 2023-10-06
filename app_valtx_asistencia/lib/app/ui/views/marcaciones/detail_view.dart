import 'package:app_valtx_asistencia/app/ui/components/assistance_day_user.dart';
import 'package:app_valtx_asistencia/app/ui/components/bottomDetail.dart';
import 'package:app_valtx_asistencia/app/ui/components/calendar.dart';
import 'package:app_valtx_asistencia/app/ui/components/date_today.dart';
import 'package:app_valtx_asistencia/app/ui/components/types_validations.dart';
import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * 0.08,
                elevation: 0.18,
                shadowColor: Colors.grey,
                backgroundColor: Colors.white,
                title: const Text('Mis marcaciones',
                    style: TextStyle(
                        color: Color.fromRGBO(38, 52, 113, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ),
              body: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Calendario
                  Calendar(),
                  //Tipos de validación
                  TypesValidations(),
                  //Fecha de hoy
                  DateToday(),
                  //Marcaciones del dia
                  AssistanceDayUser(),
                  //faltas o tardanzas del mes
                  BottomDetail(),
                ],
              ),
            ));
  }
}
