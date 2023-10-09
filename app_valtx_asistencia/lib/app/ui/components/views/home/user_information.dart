import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10, right: 10.0, bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Obx(() {
              return controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : controller.responseUserAssistanceWeek.isEmpty
                      ? Center(
                          child: Text(
                              '${controller.statusMessageUserInformation}'),
                        )
                      : ListTile(
                          leading:
                              const CircleAvatar(backgroundColor: Colors.blue,),
                          title: Text(
                              "${controller.responseUserInformation.value.names} ${controller.responseUserInformation.value.lastNames}"),
                          subtitle: Row(
                            children: [
                              const Icon(
                                Iconsax.location,
                                color: Color.fromRGBO(38, 52, 113, 1),
                              ),
                              Text(
                                  "${controller.responseUserInformation.value.primaryAddress}"),
                            ],
                          ),
                        );
            })));
  }
}
