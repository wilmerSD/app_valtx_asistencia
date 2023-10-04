import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color.fromRGBO(250, 250, 250, 1);
  static const Color red = Color.fromRGBO(230, 0, 0, 1.0);
  static const Color redLoading = Color.fromRGBO(230, 0, 0, 0.8);
  static const Color black = Color.fromRGBO(27, 21, 61, 1.0);
  static const Color grayLight = Color.fromRGBO(146, 146, 178, 1);
  static const Color light = Color.fromRGBO(239, 239, 239, 1.0);
  static const Color grayDark = Color.fromRGBO(47, 46, 65, 1);
  static const Color green = Color.fromRGBO(0, 188, 75, 1);
  //-----------
  static const Color purpleCustom = Color.fromRGBO(53, 43, 200, 1);
  static const Color blueCustom = Color.fromRGBO(47, 119, 234, 1);

  static const Color borderForm = Color.fromRGBO(230, 230, 241, 1);

  static const Color green02 = Color.fromRGBO(0, 166, 90, 1);
  static const Color green03 = Color.fromRGBO(0, 166, 90, 0.65);
  static const Color orangeCustom = Color.fromRGBO(221, 75, 57, 1);
  static const Color purpleCustomLoading = Color.fromRGBO(53, 43, 200, 0.8);
  static const Color blueCustomLoading = Color.fromRGBO(47, 119, 234, 0.8);
  static const Color giftColor = Color.fromRGBO(223, 240, 216, 1.0);
  static const Color noConectionColor = Color.fromRGBO(246, 185, 278, 1.0);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      red,
      red,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  //---
  static const LinearGradient primaryGradientLoading = LinearGradient(
    colors: [
      redLoading,
      redLoading,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient greenGradient = LinearGradient(
      colors: [green02, green02],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static const LinearGradient greenGradientLoading = LinearGradient(
      colors: [green03, green03],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
}
