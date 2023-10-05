import 'package:app_valtx_asistencia/app/ui/components/ctn_calendar.dart';
import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate ='${now.day} ${_getMonthName(now.month)} ${now.year}';
    final ageMonth ='${_getMonthName(now.month)} ${now.year}';

    return GetBuilder<DetailController>(
        builder: (controller) => Scaffold(
          backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * 0.08,
                elevation: 0.18,
                shadowColor:Colors.grey,
                backgroundColor: Colors.white,
                title: const Text('Mis marcaciones',style: TextStyle(
                  color: Color.fromRGBO(38, 52, 113, 1), fontSize: 24,fontWeight: FontWeight.bold) ),
                ),
              body:
                Column(
                  children: [
                    //Calendario
                    Stack(
                      alignment : AlignmentDirectional.topStart,
                      children: [
                        const CtnCalendar(),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin:const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.03,
                            decoration:BoxDecoration(
                            color:const Color.fromRGBO(38, 52, 113, 1),
                            borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              ageMonth,
                              style:const TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ]
                    ),
                    Container(
                      margin:const EdgeInsets.only(left: 10.0, right: 10.0),
                      height: 72.0,
                      child: Container(
                        child: Obx(
                          () {
                            if (controller.responseTypesValidations.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.responseTypesValidations.length,
                                separatorBuilder: (context, index) {
                                  // Espacio entre los elementos
                                  return const SizedBox(width: 50.0);
                                },
                                itemBuilder: (context, index) {
                                  final item = controller.responseTypesValidations[index];
                                  Color circleColor = getCircleColor(item.idValidation);
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle, 
                                            color: circleColor,
                                          ),
                                        ),
                                        const SizedBox(height: 8), // Espacio entre el círculo y el texto
                                        Text(item.description, style:const TextStyle(fontSize: 14.0, color: Colors.grey),),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    //Fecha de hoy
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      width: double.infinity,
                      height: 30.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          formattedDate,
                          style:const TextStyle(
                            color: Color.fromRGBO(38, 52, 113, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    //Marcaciones del dia
                    Container(
                      margin:const EdgeInsets.only(left: 10.0,right: 10.0),
                      height: MediaQuery.of(context).size.height * 0.28,
                      //color: Colors.green,
                      child: Obx(() {
                          if (controller.responseDataDia.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }else {
                            return Row(
                              mainAxisAlignment :MainAxisAlignment.spaceBetween ,
                              children: [
                                Column(
                                  mainAxisAlignment :MainAxisAlignment.spaceAround ,
                                  children: controller.responseDataDia.map((itemdia) {
                                    Color circleColordia = getCircleColor(itemdia.idValidation);
                                    return Row(
                                      children: [
                                        Container(
                                          width: 20, 
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: circleColordia,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0,),
                                        Text(itemdia.time, style: const
                                          TextStyle(color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,),),
                                      ],
                                    );
                                  }).toList(),
                                ),
                                Column(
                                  mainAxisAlignment :MainAxisAlignment.spaceAround ,
                                  children: controller.responseDataDia.map((itemdia) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 10.0,),
                                        Text(itemdia.typesMarking, style: const
                                          TextStyle(color: Color.fromRGBO(38, 52, 113, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,),),
                                        const Text('Sin observaciones',style: 
                                          TextStyle(color: Colors.grey,
                                          fontSize: 13,),),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ],
                            );
                          }
                      },
                                        ),
                    ),
                    //faltas o tardanzas del mes
                    Container(
                      margin:const EdgeInsets.only(left: 10.0,right: 10.0),
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: Colors.red,
                      child: Obx(() {
                          if (controller.responseDataMes.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }else {
                            return Row(
                              mainAxisAlignment :MainAxisAlignment.spaceBetween ,
                              children: [
                                Column(
                                  mainAxisAlignment :MainAxisAlignment.spaceAround ,
                                  children: controller.responseDataMes.map((itemmes) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 10.0,),
                                        Text('$itemmes.quantity', style: const
                                          TextStyle(color: Color.fromRGBO(38, 52, 113, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,),),
                                        Text(itemmes.description,style: const
                                          TextStyle(color: Colors.grey,
                                          fontSize: 13,),),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ],
                            );
                          }
                      },
                      ),
                    ),
                  ],
                ),
            )
          );
  }
  String _getMonthName(int month) {
    // Lista de nombres de meses en español
    final monthNames = [
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio',
      'Agosto', 'Setiembre', 'Octubre', 'Noviembre', 'Diciembre'
    ];
    return monthNames[month - 1]; // Restamos 1 porque los índices comienzan en 0
  }
  Color getCircleColor(int idValidacion) {
    Color circleColor;

    switch (idValidacion) {
      case 1:
        circleColor = Colors.green;
        break;
      case 2:
        circleColor = Colors.yellow;
        break;
      case 3:
        circleColor = Colors.red;
        break;
      default:
        circleColor = Colors.grey;
        break;
    }

    return circleColor;
  }
}
