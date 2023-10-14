import 'package:app_valtx_asistencia/app/ui/components/views/views_login/text_login.dart';
import 'package:app_valtx_asistencia/app/ui/views/splash/splash_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => Obx(() => controller.isLoading.value
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                decoration: const BoxDecoration(color: AppColors.light),
                child: const Center(
                  child: TextLogin(
                      text: "VALTX",
                      size: 46.0,
                      colors: Color.fromARGB(255, 1, 2, 96),
                      alignment: TextAlign.center),
                ),
              )
            : AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: AppColors.backgroundColor,
                        title: const Text('Ups...'),
                        content: Text(controller.messageError.value),
                      )
            ));
  }
}