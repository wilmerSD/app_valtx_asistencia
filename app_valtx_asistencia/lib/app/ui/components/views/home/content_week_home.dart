import 'package:app_valtx_asistencia/app/ui/components/funtions/funtion_color_circle.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentWeekHome extends StatelessWidget {
  const ContentWeekHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helpers = Helpers();
    return GetBuilder<HomeController>(
        builder: (controller) => Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  height: MediaQuery.of(context).size.height * 0.03,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Mis marcaciones recientes',
                        style: TextStyle(
                            color: Color.fromRGBO(38, 52, 113, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        helpers.getWeekCurrent(),
                        style: const TextStyle(
                            color: Color.fromRGBO(38, 52, 113, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Obx(() {
                    return controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : controller.responseUserAssistanceWeek.isEmpty
                            ? Center(
                                child: Text('${controller.statusMessageWeek}'),
                              )
                            : ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller
                                    .responseUserAssistanceWeek.length,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 25.0);
                                },
                                itemBuilder: (context, index) {
                                  final item = controller
                                      .responseUserAssistanceWeek[index];
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
                  }),
                )
              ],
            ));
  }
}
