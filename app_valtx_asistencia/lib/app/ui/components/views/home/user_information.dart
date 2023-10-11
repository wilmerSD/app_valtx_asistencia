import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
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
            margin: const EdgeInsets.only(left: 10, right: 10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            child: Obx(() {
              return controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                      title: Text(
                          "${controller.responseUserInformation.value.names} ${controller.responseUserInformation.value.lastNames}"),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Iconsax.location,
                            color: Color.fromRGBO(38, 52, 113, 1),
                          ),
                          Text(controller.nameLocation.value),
                        ],
                      ),
                      trailing: GestureDetector(
                        onTap: () => controller.loginout(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 244, 129, 22),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Iconsax.login,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ),
                      ),
                    );
            })));
  }
}
