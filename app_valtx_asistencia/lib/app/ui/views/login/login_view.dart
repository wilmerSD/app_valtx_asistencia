import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_error.dart';
import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/views_login/alert_error_login2.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/views_login/custom_input_field.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/validators.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxBool isVisible = RxBool(true);

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            // Verifica si se debe mostrar el AlertDialog
            /* if (controller.messageError.isNotEmpty) */

            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                // boxShadow:
                //color: Color.fromARGB(255, 255, 139, 7)
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
                  color: Color.fromARGB(255, 255, 255, 255),
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
                        SizedBox(height: 30),
                        text("Sistema de asistencia", 26.0,
                            Color.fromARGB(255, 1, 2, 96), TextAlign.center),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomInputField(
                          label: "Nro. documento",
                          //onChanged: controller.onEmailChanged,
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
                          //onChanged: controller.onPasswordChanged,
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
                        color: const Color.fromARGB(241, 247, 103, 1),
                        sombra: const Color.fromARGB(241, 247, 103, 1))
                  ],
                ),
              ),
            ),

            if (controller.messageError.value.isNotEmpty)
              /* AlertErrorLogin2(
                  OnTap: () {
                    controller.messageError.value = "";
                  },
                  text: "${controller.messageError}"), */
              /* AltError(
                textError: "${controller.messageError}",
                /* OnTap: () {
                  controller.messageError.value = "";
                }, */
              ), */
              Container(
                child: Obx(() {
                  return controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Visibility(
                          visible: isVisible.value,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: // Verifica si se debe mostrar el AlertDialog
                                AlertDialog(
                                    backgroundColor:
                                        Color.fromARGB(240, 176, 176, 176),
                                    title: const Text("Tipo de error"),
                                    content: Text("${controller.messageError}",
                                        textAlign: TextAlign
                                            .center), // Usa el mensaje de error del controlador
                                    actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      controller.messageError.value = "";
                                      /* Navigator.of(context).pushReplacement; */
                                      /* Get.back(); */
                                      isVisible.value = false;
                                    },
                                    child: const Text("OK"),
                                  ),
                                ]),
                          ),
                        );
                }
                    /* () => Visibility(
                    visible: isVisible.value,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: // Verifica si se debe mostrar el AlertDialog
                          AlertDialog(
                              backgroundColor: Color.fromARGB(240, 176, 176, 176),
                              title: const Text("Tipo de error"),
                              content: Text("${controller.messageError}",
                                  textAlign: TextAlign
                                      .center), // Usa el mensaje de error del controlador
                              actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                controller.messageError.value = "";
                                /* Navigator.of(context).pushReplacement; */
                                /* Get.back(); */
                                isVisible.value = false;
                              },
                              child: const Text("OK"),
                            ),
                          ]),
                    ),
                  ), */
                    ),
              )
            /* Align(
                alignment: Alignment.bottomCenter,
                child: // Verifica si se debe mostrar el AlertDialog
                    AlertDialog(
                        backgroundColor: Color.fromARGB(240, 176, 176, 176),
                        title: const Text("Tipo de error"),
                        content: Text("${controller.messageError}",
                            textAlign: TextAlign
                                .center), // Usa el mensaje de error del controlador
                        actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          controller.messageError.value = "";
                          /* Navigator.of(context).pushReplacement; */
                          /* Get.back(); */
                          Get.offNamed(AppRoutesName.DETAIL);
                        },
                        child: const Text("OK"),
                      ),
                    ]),
              ) */
            /* if (controller.messageError
                .isNotEmpty) // Verifica si se debe mostrar el AlertDialog
              AlertDialog(
                title: Text("${controller.messageError}"),
                content: Text(controller
                    .messageError), // Usa el mensaje de error del controlador
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cierra el diálogo
                    },
                    child: Text("OK"),
                  ),
                ],
              ), */
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
      //fontStyle: FontStyle.normal
    ),
  );
}
