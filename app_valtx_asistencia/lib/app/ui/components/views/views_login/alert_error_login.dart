import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertErrorLogin extends StatelessWidget {
  const AlertErrorLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Obx(
        () {
          return controller.isLoading.value
              ? const Center(
                  child: SizedBox(
                    width: 80.0, //
                    height: 80.0, //
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(241, 247, 103, 1)),
                      strokeWidth: 6.0,
                    ),
                  ),
                )
              : Visibility(
                  visible: controller.isVisible.value,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AlertDialog(
                      backgroundColor: const Color.fromARGB(240, 176, 176, 176),
                      title: const Text(
                        "Tipo de error",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      content: Text(
                        "${controller.messageError}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            controller.messageError.value = "";
                            controller.isVisible.value = false;
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
