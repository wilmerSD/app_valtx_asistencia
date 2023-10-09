import 'package:app_valtx_asistencia/app/ui/components/dashed_line.dart';
import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomHome extends StatelessWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        builder: (controller) => Container(
          height: 100.0,
          child: Column(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 9.0, // Radio de desenfoque
                        spreadRadius: 0.6, // Extensión de la sombra
                        offset: Offset(0, -6),
                      ),
                    ],
                  )),
                  const Divider(
                    color: Colors.white70,
                    height: 3.0,
                  ),
                  SizedBox(
                    //color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Obx(
                      () {
                        if (controller.responseDataMes.isEmpty) {
                          return Center(
                            child: Text('${controller.statusMessageMonth}'),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: controller.responseDataMes.map((itemMonth) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${itemMonth.quantity}',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(38, 52, 113, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    itemMonth.description!,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
        ));
  }
}
