import 'package:flutter/material.dart';

class TypesAssistances extends StatelessWidget {
const TypesAssistances({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:const Text('Seleccionar tipo de marcación'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title:const Text('Entrada'),
            onTap: () {
              // Aquí puedes realizar la acción correspondiente a la marcación 1 (entrada)
              Navigator.pop(context, 1); // Cierra el diálogo y devuelve el valor 1
            },
          ),
          ListTile(
            title:const Text('Almuerzo'),
            onTap: () {
              // Aquí puedes realizar la acción correspondiente a la marcación 2 (almuerzo)
              Navigator.pop(context, 2); // Cierra el diálogo y devuelve el valor 2
            },
          ),
          ListTile(
            title:const Text('Fin Almuerzo'),
            onTap: () {
              // Aquí puedes realizar la acción correspondiente a la marcación 3 (fin almuerzo)
              Navigator.pop(context, 3); // Cierra el diálogo y devuelve el valor 3
            },
          ),
          ListTile(
            title:const Text('Salida'),
            onTap: () {
              // Aquí puedes realizar la acción correspondiente a la marcación 4 (salida)
              Navigator.pop(context, 4); // Cierra el diálogo y devuelve el valor 4
            },
          ),
        ],
      ),
    );
  }
}

