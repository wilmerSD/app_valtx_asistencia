import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helpers = Helpers();
    return GetBuilder<HomeController>(
        builder: (controller) => Column(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.15,
                      margin: const EdgeInsets.only(top: 40.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {
                          controller.navigateToScreen();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Color.fromRGBO(38, 52, 113, 1),
                        ),
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.068,
                        width: MediaQuery.of(context).size.width * 0.68,
                        margin: const EdgeInsets.only(top: 40.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Valtx',
                              style: TextStyle(
                                  color: Color.fromRGBO(38, 52, 113, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              helpers.getDateLarge(),
                              style: TextStyle(color: Colors.grey),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(57, 33, 149, 243),
                              ),
                              child: const Icon(
                                Iconsax.notification,
                                color: Color.fromRGBO(38, 52, 113, 1),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ]));
  }
}
