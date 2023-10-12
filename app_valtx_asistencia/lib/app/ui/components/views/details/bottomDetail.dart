import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
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
                  child: Obx(() {
                    return controller.isLoading.value
                        ? Center(child: CircularProgressIndicator())
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
                                  /* Color circleColor =
                                      getCircleColor(itemMonth.idValidation ?? 0); */
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${itemMonth.quantity}',
                                        style: const TextStyle(
                                          color: Color.fromRGBO(38, 52, 113, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        itemMonth.description!,
                                        style: const TextStyle(
                                          color: Colors.grey,
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
