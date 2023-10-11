import 'package:app_valtx_asistencia/app/ui/components/views/views_login/text_login.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      decoration: const BoxDecoration(
          color: AppColors.light /* gradient: AppColors.primaryGradient */),
      child: const Center(
        child: TextLogin(
            text: "VALTX",
            size: 46.0,
            colors: Color.fromARGB(255, 1, 2, 96),
            alignment: TextAlign.center),
        /* child: Image(
          image: const AssetImage(
            "assets/images/logo_white.png",
          ),
          width: 220.w,
        ), */
      ),
    );
  }
}
