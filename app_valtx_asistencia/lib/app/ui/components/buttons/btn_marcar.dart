import 'package:flutter/material.dart';

class BtnMarcar extends StatelessWidget {
  const BtnMarcar({
    Key? key,
    required this.OnTap,
    required this.title,
    required this.gradient,
    required this.sombra,
  }) : super(key: key);

  final void Function() OnTap;
  final String title;
  final LinearGradient gradient;
  final Color sombra;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        margin: EdgeInsets.only(left: 10.0,right: 10.0),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.06,
        //margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            gradient: gradient,
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
