// ignore_for_file: dead_code

import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle(this.context);
  final BuildContext context;

  TextStyle titleAppBar({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: color, fontWeight: FontWeight.bold);

  TextStyle titleButton({
    Color color = AppColors.backgroundColor,
  }) =>
      Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 18.0);

  TextStyle textError({
    Color color = AppColors.black,
  }) =>
      Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: color, fontWeight: FontWeight.w400, fontSize: 18.0);

  TextStyle bold24({double size = 24.0, Color color = Colors.white}) =>
      Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: color, fontWeight: FontWeight.w700, fontSize: 24.0);

  TextStyle bold16({Color? color = AppColors.black}) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: color, fontWeight: FontWeight.w700, fontSize: 16.0);
  //-----------------------------

  TextStyle bold18({Color? color = Colors.black, double size = 18.0}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.w700, fontSize: size);

  TextStyle semi14({Color color = AppColors.grayLight, double size = 14.0}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.w500, fontSize: size);
  TextStyle semi16({Color color = AppColors.grayLight, double size = 16.0}) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.w500, fontSize: size);

  TextStyle medium14({
    Color color = AppColors.grayLight,
    double size = 14.0,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.w400,
            fontSize: size,
          );

  TextStyle extra24({Color? color = AppColors.blueDark}) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 24.0);

  TextStyle extra20({Color? color = AppColors.blueDark}) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 20.0);

  TextStyle extra16({Color? color = AppColors.blueDark}) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 16.0);

  TextStyle extra14({Color? color = AppColors.blueDark}) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 14.0);
}
