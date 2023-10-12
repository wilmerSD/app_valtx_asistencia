import 'package:app_valtx_asistencia/app/ui/components/dashed_line.dart';
import 'package:app_valtx_asistencia/app/ui/components/funtions/funtion_color_circle.dart';
import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssistanceDayUser extends StatelessWidget {
  const AssistanceDayUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        builder: (controller) => Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              height: MediaQuery.of(context).size.height * 0.28,
              child: Obx(() {
                return controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.responseDataDia.isEmpty
                        ? Center(
                            child: Text('${controller.statusMessageDay}'),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.max,
                            /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  padding: const EdgeInsets.only(top: 10),
                                  /* scrollDirection: Axis.horizontal, */
                                  itemCount: controller.responseDataDia.length,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 20.0);
                                  },
                                  itemBuilder: (context, index) {
                                    final itemDay =
                                        controller.responseDataDia[index];
                                    Color circleColordia =
                                        getCircleColor(itemDay.idValidation!);
                                    /* Color circleColor =
                                    getCircleColor(itemMonth.idValidation ?? 0); */
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: circleColordia,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              itemDay.time!,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              itemDay.typesMarking!,
                                              style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    38, 52, 113, 1),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const Text(
                                              'Sin observaciones',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              )
                            ],
                          );
              }),
            ));
  }
}
