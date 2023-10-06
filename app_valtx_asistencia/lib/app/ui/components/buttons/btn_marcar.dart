import 'package:flutter/material.dart';

class BtnMarcar extends StatelessWidget {
  const BtnMarcar({
    Key? key,
    required this.OnTap,
    required this.title,
    required this.color,
    required this.sombra,
  }) : super(key: key);

  final void Function() OnTap;
  final String title;
  final Color color;
  final Color sombra;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50.0,
        //margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: sombra,
                blurRadius: 5.0,
                offset: Offset(0, 3),
                spreadRadius: 0.0,
              ),
            ]),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
