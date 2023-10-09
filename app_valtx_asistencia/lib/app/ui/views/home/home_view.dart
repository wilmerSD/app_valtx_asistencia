 import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/templates/custom_scaffold_base.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoicGl0bWFjIiwiYSI6ImNsY3BpeWxuczJhOTEzbnBlaW5vcnNwNzMifQ.ncTzM4bW-jpq-hUFutnR1g';
    
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              body: Stack(children: [
                Obx(
                  () => FlutterMap(
                      options: MapOptions(
                          /* center: controller.myPosition.value, */
                          center: LatLng(controller.latitude.value,
                              controller.longitude.value),
                          minZoom: 10,
                          zoom: 18),
                      nonRotatedChildren: [
                        TileLayer(
                            urlTemplate:
                                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                            additionalOptions: const {
                              'accessToken': MAPBOX_ACCESS_TOKEN,
                              'id': 'mapbox/streets-v12'
                            }),
                        MarkerLayer(
                          markers: [
                            Marker(
                              /* point: controller.myPosition.value!, */
                              point: LatLng(controller.latitude.value,
                                  controller.longitude.value),
                              builder: (context) {
                                return Container(
                                  child: const Icon(
                                    Icons.person_pin,
                                    color: Colors.blueAccent,
                                    size: 40,
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      ]),
                ),
                /* FlutterMap(
                    options: MapOptions(
                        /* center: controller.myPosition.value, */
                        /* center: controller.myPosition, */
                        center:
                            LatLng(controller.latitude, controller.longitude),
                        minZoom: 10,
                        zoom: 18),
                    nonRotatedChildren: [
                      TileLayer(
                          urlTemplate:
                              'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                          additionalOptions: const {
                            'accessToken': MAPBOX_ACCESS_TOKEN,
                            'id': 'mapbox/streets-v12'
                          }),
                      MarkerLayer(
                        markers: [
                          Marker(
                            /* point: controller.myPosition!, */
                            point: LatLng(
                                controller.latitude, controller.longitude),
                            /* point: controller.myPosition.value!, */
                            builder: (context) {
                              return Container(
                                child: const Icon(
                                  Icons.person_pin,
                                  color: Colors.blueAccent,
                                  size: 40,
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ]), */
                Positioned(
                    bottom: 20,
                    left: 10,
                    right: 10,
                    //top: 10, // Ajusta la posición vertical del texto
                    //left: 10, // Ajusta la posición horizontal del texto
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /*  Obx(() => Text(
                                  'Latitud: ${controller.latitude.value}')),
                              Obx(() => Text(
                                  'Longitud: ${controller.longitude.value}')), */
                              Text('Latitud: ${controller.latitude}'),
                              Text('Longitud: ${controller.longitude}'),
                              ElevatedButton(
                                onPressed: () {
                                  controller.obtenerUbicacion();
                                },
                                child: Text(
                                    'Obtener Ubicación ${controller.cantidadF}'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          /* padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0), */
                          //width: 400.0,
                          width: double.infinity,
                          //height: 100.0,
                          height: MediaQuery.of(context).size.height * 0.17,
                          //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Mis marcaciones recientes',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 5, 0, 80),
                                            fontWeight: FontWeight.w900)),
                                    Text('18-23 Set',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 5, 0, 80),
                                            fontWeight: FontWeight.w900))
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    OpcDay(
                                        color:
                                            Color.fromARGB(255, 19, 231, 125),
                                        text: 'Lun'),
                                    OpcDay(
                                        color:
                                            Color.fromARGB(255, 231, 136, 19),
                                        text: 'Mar'),
                                    OpcDay(
                                        color:
                                            Color.fromARGB(255, 231, 136, 19),
                                        text: 'Mir'),
                                    OpcDay(
                                        color:
                                            Color.fromARGB(255, 19, 231, 125),
                                        text: 'Jue'),
                                  ],
                                )
                              ]),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 20.0),
                          //width: 400.0,
                          width: double.infinity,
                          //height: 100.0,
                          height: MediaQuery.of(context).size.height * 0.24,
                          //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SizedBox(width: 50),
                                  CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    radius: 25,
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Wilmer Sanchez',
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 5, 0, 80),
                                              fontWeight: FontWeight.w900)),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Color.fromARGB(
                                                255, 192, 192, 192),
                                          ),
                                          Text('Jr.Zorrito 258, Breña',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 168, 168, 169)))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Divider(
                                color: Color.fromARGB(
                                    255, 168, 168, 169), // Color de la línea
                                height: 2.0, // Grosor de la línea
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  /* Obx(() => OpcCount(
                                      text: 'Faltas',
                                      cantidad: '${controller.cantidadF}')),
                                  Obx(() => OpcCount(
                                      text: 'Tardanzas',
                                      cantidad: '${controller.cantidadT}')),
                                  Obx(() => OpcCount(
                                      text: 'Tardanzas',
                                      cantidad: '${controller.cantidadJ}')), */

                                  OpcCount(
                                      text: 'Faltas',
                                      cantidad: '${controller.cantidadF}'),
                                  OpcCount(
                                      text: 'Tardanzas',
                                      cantidad: '${controller.cantidadT}'),
                                  OpcCount(
                                      text: 'Tardanzas',
                                      cantidad: '${controller.cantidadJ}')
                                  /*  OpcCount(text: 'Tardanzas', cantidad: 2),
                              OpcCount(text: 'Justificados', cantidad: 0), */
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        BtnMarcar(
                          OnTap: () {
                            controller.doRegistry();
                            _showAlertDialog(context);
                          },
                          title: 'Marcar',
                          color: const Color.fromARGB(255, 244, 129, 22),
                          sombra: const Color.fromARGB(255, 244, 129, 22),
                        ),
                      ],
                    ))
              ]),
              /* Container(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                height: double.infinity,
                //height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/fondoinicial.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                    const Text(
                      'Valtx',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Color.fromARGB(255, 3, 48, 120),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() =>
                              Text('Latitud: ${controller.latitude.value}')),
                          Obx(() =>
                              Text('Longitud: ${controller.longitude.value}')),
                          ElevatedButton(
                            onPressed: () {
                              controller.obtenerUbicacion();
                            },
                            child: Text('Obtener Ubicación'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      //width: 400.0,
                      width: double.infinity,
                      //height: 100.0,
                      height: MediaQuery.of(context).size.height * 0.17,
                      //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Mis marcaciones recientes',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 0, 80),
                                    fontWeight: FontWeight.w900)),
                            Text('18-23 Set',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 0, 80),
                                    fontWeight: FontWeight.w900))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OpcDay(
                                color: Color.fromARGB(255, 19, 231, 125),
                                text: 'Lun'),
                            OpcDay(
                                color: Color.fromARGB(255, 231, 136, 19),
                                text: 'Mar'),
                            OpcDay(
                                color: Color.fromARGB(255, 231, 136, 19),
                                text: 'Mir'),
                            OpcDay(
                                color: Color.fromARGB(255, 19, 231, 125),
                                text: 'Jue'),
                          ],
                        )
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      //width: 400.0,
                      width: double.infinity,
                      //height: 100.0,
                      height: MediaQuery.of(context).size.height * 0.24,
                      //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(width: 50),
                              CircleAvatar(
                                backgroundColor: Colors.orange,
                                radius: 25,
                              ),
                              SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Wilmer Sanchez',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 5, 0, 80),
                                          fontWeight: FontWeight.w900)),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
                                      ),
                                      Text('Jr.Zorrito 258, Breña',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 168, 168, 169)))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const Divider(
                            color: Color.fromARGB(
                                255, 168, 168, 169), // Color de la línea
                            height: 2.0, // Grosor de la línea
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(() => OpcCount(
                                  text: 'Faltas',
                                  cantidad: '${controller.cantidadF}')),
                              Obx(() => OpcCount(
                                  text: 'Tardanzas',
                                  cantidad: '${controller.cantidadT}')),
                              Obx(() => OpcCount(
                                  text: 'Tardanzas',
                                  cantidad: '${controller.cantidadJ}')),
                              /*  OpcCount(text: 'Tardanzas', cantidad: 2),
                              OpcCount(text: 'Justificados', cantidad: 0), */
                            ],
                          ),
                        ],
                      ),
                    ),
                    BtnMarcar(
                      OnTap: () {
                        controller.doRegistry();
                        _showAlertDialog(context);
                      },
                      title: 'Marcar',
                      color: const Color.fromARGB(255, 244, 129, 22),
                      sombra: const Color.fromARGB(255, 244, 129, 22),
                    )
                  ],
                ),
              ), */
            ));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AltMarcar());
  }
}