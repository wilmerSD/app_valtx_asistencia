import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AltMarcarOk extends StatelessWidget {
  const AltMarcarOk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
        builder: (controller) => Obx(() {
              final item = controller.responseUserAssistance[0];
              return Center(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Color.fromARGB(255, 76, 201, 170),
                            size: 80.0,
                          ),
                        ),
                        Text(
                          'Asistencia registrada como ${item.registradoComo}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 3, 48, 120),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_sharp,
                              color: Color.fromARGB(255, 244, 129, 22),
                            ),
                            Text(
                              '${item.ubicacin}',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 3, 48, 120),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 3, 48, 120),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(137, 71, 70, 70),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3),
                                    spreadRadius: 0.0,
                                  ),
                                ]),
                            child: const Text(
                              'Cerrar',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ]),
                ),
              );
            }));
  }
}
