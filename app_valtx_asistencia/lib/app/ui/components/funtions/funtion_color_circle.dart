import 'package:flutter/material.dart';

Color getCircleColor(int idValidacion) {
  Color circleColor;
  switch (idValidacion) {
    case 1:
      circleColor = Colors.green;
      break;
    case 2:
      circleColor = Colors.yellow;
      break;
    case 3:
      circleColor = Colors.red;
      break;
    default:
      circleColor = Colors.grey;
      break;
  }
  return circleColor;
}
