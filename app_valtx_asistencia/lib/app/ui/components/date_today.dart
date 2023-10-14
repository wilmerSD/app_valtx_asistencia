import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';

final helpers = Helpers();
class DateToday extends StatelessWidget {
  const DateToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = '${now.day} ${helpers.getMonthName(now.month)} ${now.year}';
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      width: double.infinity,
      height: 30.0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          formattedDate,
          style: const TextStyle(
            color: Color.fromRGBO(38, 52, 113, 1),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
