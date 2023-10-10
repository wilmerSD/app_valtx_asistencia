import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
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
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    //color: Colors.red,
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
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: controller
                                        .responseUserAssistanceMonth
                                        .map((itemMonth) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${itemMonth.quantity}',
                                            style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  38, 52, 113, 1),
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
                                    }).toList(),
                                  );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
