import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
      child: Center(
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
