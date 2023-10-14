import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_error.dart';
import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/views_login/forms_login.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/views_login/text_login.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/reunion.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const TextLogin(
                    text: "Valtx",
                    size: 40.0,
                    colors: AppColors.backgroundColor,
                    alignment: TextAlign.center),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.63,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      FormsLogin(
                        onChangedUserName: (value) {
                          controller.userName = value;
                        },
                        onChangedPassword: (value) {
                          controller.password = value;
                        },
                      ),
                      BtnMarcar(
                          OnTap: controller.doAuth,
                          title: 'Iniciar sesión',
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.degradedInitial,
                              AppColors.degradedEnd,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          sombra: AppColors.degradedInitial)
                    ],
                  ),
                ),
              ),
              Obx(
                () => AltError(
                    textError: controller.messageError.value,
                    isVisible: controller.isVisible.value,
                    isLoading: controller.isLoading.value,
                    OnTap: () {
                      controller.messageError.value = "";
                      controller.isVisible.value = false;
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
