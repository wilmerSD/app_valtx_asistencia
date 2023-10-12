import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_marcar_ok.dart';
import 'package:flutter/material.dart';

class BtnTypeMarcar extends StatelessWidget {
  const BtnTypeMarcar({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showAlertDialog(context);
      },
      child: Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 120.0,
        margin: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 129, 22),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(137, 71, 70, 70),
                blurRadius: 5.0,
                offset: Offset(0, 3),
                spreadRadius: 0.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Color.fromARGB(255, 3, 48, 120),
              size: 70.0,
            ),
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                  fontSize: 14.0, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AltMarcarOk());
  }
}
