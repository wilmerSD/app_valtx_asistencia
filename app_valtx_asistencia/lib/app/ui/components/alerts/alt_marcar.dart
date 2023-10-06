import 'package:flutter/material.dart';

class AltMarcar extends StatelessWidget {
  const AltMarcar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.check_circle_outline,
              color: Color.fromARGB(255, 76, 201, 170),
              size: 80.0,
            ),
          ),
          const Text(
            'Asistencia registrada correctamente',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Color.fromARGB(255, 3, 48, 120),
              decoration: TextDecoration.none,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${today.hour.toString()}:${today.minute.toString()}:${today.second.toString()}',
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 3, 48, 120),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                '${today.day.toString()}/${today.month.toString()}/${today.year.toString()}',
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 3, 48, 120),
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_sharp,
                color: Color.fromARGB(255, 244, 129, 22),
              ),
              Text(
                'San Borja, Av. Circunvalación',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 3, 48, 120),
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                    color: Color.fromARGB(255, 255, 255, 255),
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
