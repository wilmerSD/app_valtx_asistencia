import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomHome extends StatelessWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
              height: MediaQuery.of(context).size.height * 0.11,
              margin:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                color: AppColors.backgroundColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Obx(
                      () {
                        return controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : controller.responseUserAssistanceMonth.isEmpty
                                ? Center(
                                    child: Text(
                                        '${controller.statusMessageMonth}'),
                                  )
                                : ListView.separated(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller
                                        .responseUserAssistanceMonth.length,
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(width: 25.0);
                                    },
                                    itemBuilder: (context, index) {
                                      final itemMonth = controller
                                          .responseUserAssistanceMonth[index];
                                      /* Color circleColor =
                                      getCircleColor(itemMonth.idValidation ?? 0); */
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('${itemMonth.quantity}',
                                              style: AppTextStyle(context)
                                                  .extra20()),
                                          Text(itemMonth.description!,
                                              style: AppTextStyle(context)
                                                  .medium14()),
                                        ],
                                      );
                                    },
                                  );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
