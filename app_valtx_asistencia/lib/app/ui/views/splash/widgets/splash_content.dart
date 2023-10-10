import 'package:app_valtx_asistencia/app/ui/views/login/login_view.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      decoration: const BoxDecoration(
          color: AppColors.light /* gradient: AppColors.primaryGradient */),
      child: Center(
          child: text(
              "VALTX", 46.0, Color.fromARGB(255, 1, 2, 96), TextAlign.center)
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
