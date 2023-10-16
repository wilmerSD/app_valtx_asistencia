import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
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
              color: AppColors.backgroundColor,
            ),
            child: Obx(() {
              return controller.isLoadingUser.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.blueDark,
                        radius: 25,
                        child: Icon(Icons.person,
                            color: AppColors.backgroundColor, size: 30),
                      ),
                      title: Text(
                        "${controller.responseUserInformation.value.names} ${controller.responseUserInformation.value.lastNames}",
                        style: AppTextStyle(context).bold16(),
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Iconsax.location,
                            color: AppColors.blueDark,
                          ),
                          Flexible(
                            child: Text(
                              controller.nameLocation.value,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                        onTap: () => controller.loginout(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: AppColors.degradedInitial,
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
