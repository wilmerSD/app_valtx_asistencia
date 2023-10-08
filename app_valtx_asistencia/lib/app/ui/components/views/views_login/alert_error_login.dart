import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertErrorLogin extends StatelessWidget {
  const AlertErrorLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => (controller.messageError.value.isNotEmpty)
          ? Align(
              alignment: Alignment.bottomCenter,
              child: AlertDialog(
                backgroundColor: Color.fromARGB(240, 176, 176, 176),
                title: const Text("Tipo de error"),
                content: Text(
                  "${controller.messageError}",
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      controller.messageError.value = "";
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
