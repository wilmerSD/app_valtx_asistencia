import 'package:app_valtx_asistencia/app/ui/components/funtions/funtion_color_circle.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContenidoWeek extends StatelessWidget {
  const ContenidoWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helpers = Helpers();
    return GetBuilder<HomeController>(
        builder: (controller) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Mis marcaciones recientes',
                      style: TextStyle(
                          color: Color.fromRGBO(38, 52, 113, 1), fontSize: 12),
                    ),
                    Text(
                      helpers.getWeekCurrent(),
                      style: const TextStyle(
                          color: Color.fromRGBO(38, 52, 113, 1), fontSize: 12),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  height: MediaQuery.of(context).size.height * 0.07,
                  color: Colors.white,
                  child: Obx(
                    () {
                      if (controller.responseUserAssistanceWeek.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.responseUserAssistanceWeek.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 50.0);
                          },
                          itemBuilder: (context, index) {
                            final item =
                                controller.responseUserAssistanceWeek[index];
                            Color circleColor =
                                getCircleColor(item.idValidation ?? 0);
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: circleColor,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  item.day ?? '',
                                  style: const TextStyle(
                                      fontSize: 14.0, color: Colors.grey),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ));
  }
}
