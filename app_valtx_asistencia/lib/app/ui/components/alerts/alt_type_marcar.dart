
import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_type_marcar.dart';
import 'package:flutter/material.dart';

class AltTypeMarcar extends StatelessWidget {
  const AltTypeMarcar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        //height: 360.0,
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnTypeMarcar(icon: Icons.start_outlined, title: 'Ingreso'),
                BtnTypeMarcar(
                    icon: Icons.food_bank, title: 'Inicio refrigerio'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnTypeMarcar(
                    icon: Icons.transit_enterexit, title: 'Fin de refrigerio'),
                BtnTypeMarcar(icon: Icons.exit_to_app, title: 'Salida'),
              ],
            ),
            //BtnMarcar()
          ],
        ),
      ),
    );
  }
}
