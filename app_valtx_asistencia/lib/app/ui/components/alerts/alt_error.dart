import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_type_marcar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AltError extends StatelessWidget {
  const AltError({
    Key? key,
    required this.textError,
    required this.isVisible,
    required this.OnTap,
  }) : super(key: key);

  final String textError;
  final bool isVisible;
  final void Function() OnTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          //height: 360.0,
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 183, 183, 183),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(textError),
              GestureDetector(
                onTap: () {
                  OnTap;
                  /*Navigator.of(context).pushReplacement; */
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  height: 40.0,
                  //margin: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 3, 48, 120),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(137, 71, 70, 70),
                          blurRadius: 5.0,
                          offset: Offset(0, 3),
                          spreadRadius: 0.0,
                        ),
                      ]),
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              //BtnMarcar()
            ],
          ),
        ),
      ),
    );
  }
}
