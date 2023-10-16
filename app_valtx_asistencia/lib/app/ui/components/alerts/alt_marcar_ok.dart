import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AltMarcarOk extends StatelessWidget {
  const AltMarcarOk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Obx(() {
              final item = controller.responseUserAssistance;
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
                            color: AppColors.logoRight,
                            size: 80.0,
                          ),
                        ),
                        Text('Asistencia registrada como ${controller.responseUserAssistance.value.registradoComo}',
                          textAlign: TextAlign.center,
                          style: AppTextStyle(context).extra20()
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_sharp,
                              color: AppColors.degradedInitial,
                            ),
                            Text(
                              controller.responseUserAssistance.value.ubicacin??'',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColors.blueDark,
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
                                color: AppColors.blueDark,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadowButton,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3),
                                    spreadRadius: 0.0,
                                  ),
                                ]),
                            child: Text(
                              'Cerrar',
                              style: AppTextStyle(context).titleButton(),
                            ),
                          ),
                        ),
                      ]),
                ),
              );
            }));
  }
}
