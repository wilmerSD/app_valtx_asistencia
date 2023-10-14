import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helpers = Helpers();
    return GetBuilder<HomeController>(
        builder: (controller) => Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.15,
                    margin: const EdgeInsets.only(top: 40.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.backgroundColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        controller.navigateToScreen();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: AppColors.blueDark,
                      ),
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.068,
                      width: MediaQuery.of(context).size.width * 0.68,
                      margin: const EdgeInsets.only(top: 40.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.backgroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Valtx',
                            style: TextStyle(
                                color: AppColors.blueDark,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ), 
                          Text(
                            helpers.getDateLarge(),
                            style:const TextStyle(color: AppColors.grayLight),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.1,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.contentNotification,
                            ),
                            child: const Icon(
                              Iconsax.notification,
                              color: AppColors.blueDark,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ]));
  }
}
