import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomDetail extends StatelessWidget {
  const BottomDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        builder: (controller) => Column(
              children: [
                Container(
                    decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grayLight,
                      blurRadius: 9.0, 
                      spreadRadius: 0.6,
                      offset: Offset(0, -6),
                    ),
                  ],
                )),
                const Divider(
                  color: AppColors.backgroundColor,
                  height: 3.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Obx(() {
                    return controller.isLoading.value
                        ?const Center(child: CircularProgressIndicator())
                        : controller.responseDataMes.isEmpty
                            ? Center(
                                child: Text('${controller.statusMessageMonth}'),
                              )
                            : ListView.separated(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.responseDataMes.length,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 25.0);
                                },
                                itemBuilder: (context, index) {
                                  final itemMonth =
                                      controller.responseDataMes[index];
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${itemMonth.quantity}',
                                        style: const TextStyle(
                                          color: AppColors.blueDark,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        itemMonth.description!,
                                        style: const TextStyle(
                                          color: AppColors.grayLight,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                  }),
                ),
              ],
            ));
  }
}
