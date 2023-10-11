import 'package:app_valtx_asistencia/app/ui/components/views/views_login/custom_input_field.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/views_login/text_login.dart';
import 'package:app_valtx_asistencia/core/helpers/validators.dart';
import 'package:flutter/material.dart';

class FormsLogin extends StatelessWidget {
  const FormsLogin({
    Key? key,
    required this.onChangedUserName,
    required this.onChangedPassword,
  }) : super(key: key);
  final void Function(String)? onChangedUserName;
  final void Function(String)? onChangedPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        const TextLogin(
            text: "Sistema de asistencia",
            size: 26.0,
            colors: Color.fromARGB(255, 1, 2, 96),
            alignment: TextAlign.center),
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
          onChanged:
              onChangedUserName /* (value) {
            controller.userName = value;
          } */
          ,
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
          onChanged:
              onChangedPassword /* (value) {
            controller.password = value;
          } */
          ,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
