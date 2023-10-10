import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/views_login/custom_input_field.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/validators.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        body: Stack(
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
              child: text("Valtx", 40.0, Colors.white, TextAlign.center),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.63,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        text(
                            "Sistema de asistencia",
                            26.0,
                            const Color.fromARGB(255, 1, 2, 96),
                            TextAlign.center),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomInputField(
                          label: "Nro. documento",
                          inputType: TextInputType.emailAddress,
                          validator: (text) {
                            if (isValidEmail(text!)) {
                              return null;
                            }
                            return "Email inválido";
                          },
                          onChanged: (value) {
                            controller.userName = value;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomInputField(
                          label: "Contraseña",
                          isPassword: true,
                          validator: (text) {
                            if (text!.trim().length >= 6) {
                              return null;
                            }
                            return "Constraseña inválida";
                          },
                          onChanged: (value) {
                            controller.password = value;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    BtnMarcar(
                        OnTap: controller.doAuth,
                        title: 'Iniciar sesión',
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 244, 129, 22),
                            Color.fromARGB(255, 255, 87, 34),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                        sombra: const Color.fromARGB(241, 247, 103, 1))
                  ],
                ),
              ),
            ),
            if (controller.messageError.value.isNotEmpty)
              Container(
                child: Obx(() {
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
                                backgroundColor:
                                    const Color.fromARGB(240, 176, 176, 176),
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
                                ]),
                          ),
                        );
                }),
              )
          ],
        ),
      ),
    );
  }
}

Widget text(String text, double size, Color colors, TextAlign alignment) {
  return Text(
    text,
    textAlign: alignment,
    style: TextStyle(
      fontSize: size,
      color: colors,
      fontWeight: FontWeight.w900,
    ),
  );
}
