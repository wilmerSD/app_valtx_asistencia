import 'package:app_valtx_asistencia/app/ui/components/funtion_color_circle.dart';
import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypesValidations extends StatelessWidget {
  const TypesValidations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        builder: (controller) => Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              height: MediaQuery.of(context).size.height * 0.07,
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
                        return const SizedBox(width: 50.0);
                      },
                      itemBuilder: (context, index) {
                        final item = controller.responseTypesValidations[index];
                        Color circleColor = getCircleColor(item.idValidation);
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
                            const SizedBox(
                                height:
                                    5),
                            Text(
                              item.description,
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
            ));
  }
}
