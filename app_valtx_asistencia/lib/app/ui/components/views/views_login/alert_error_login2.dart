import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertErrorLogin2 extends StatelessWidget {
  const AlertErrorLogin2({
    Key? key,
    required this.OnTap,
    required this.text,
  }) : super(key: key);
  final void Function() OnTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AlertDialog(
        backgroundColor: Color.fromARGB(240, 176, 176, 176),
        title: const Text("Tipo de error"),
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              OnTap;
              /* Navigator.pop(context); */
              Navigator.of(context).pushReplacement;
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
