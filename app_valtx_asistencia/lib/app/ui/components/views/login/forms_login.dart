import 'package:app_valtx_asistencia/app/ui/components/views/login/custom_input_field.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/login/text_login.dart';
import 'package:app_valtx_asistencia/core/helpers/validators.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
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
            colors: AppColors.blueDark,
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
              onChangedUserName,
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
              onChangedPassword,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
