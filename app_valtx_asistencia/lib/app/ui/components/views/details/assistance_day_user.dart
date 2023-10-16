import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final helpers = Helpers();

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
                            child: Text('${controller.statusMessageDay}',
                                style: AppTextStyle(context).medium14()),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  padding: const EdgeInsets.only(top: 10),
                                  itemCount: controller.responseDataDia.length,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 20.0);
                                  },
                                  itemBuilder: (context, index) {
                                    final itemDay =
                                        controller.responseDataDia[index];
                                    Color circleColordia = helpers
                                        .getCircleColor(itemDay.idValidation!);
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
                                              itemDay.time ?? '',
                                              style: AppTextStyle(context)
                                                  .semi16(),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              itemDay.typesMarking!,
                                              style: const TextStyle(
                                                color: AppColors.blueDark,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              'Sin observaciones',
                                              style: AppTextStyle(context)
                                                  .medium14(),
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
