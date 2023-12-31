import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AltError extends StatelessWidget {
  const AltError({
    Key? key,
    required this.textError,
    required this.isVisible,
    required this.isLoading,
    required this.OnTap,
  }) : super(key: key);

  final String textError;
  final bool isVisible;
  final bool isLoading;
  final void Function() OnTap;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Stack(
            children: [
              ModalBarrier(
                color: AppColors.modalBarrier,
                dismissible: false,
              ),
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.blueDark),
                ),
              ),
            ],
          )
        : Visibility(
            visible: isVisible,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AlertDialog(
                backgroundColor: AppColors.backgroundColor,
                title: const Text(
                  "Error",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                content: Text(
                  textError,
                  textAlign: TextAlign.center,
                  style: AppTextStyle(context).textError(),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: OnTap,
                    child: const Text("OK"),
                  ),
                ],
              ),
            ),
          );
  }
}
