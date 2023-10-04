import 'package:app_valtx_asistencia/app/ui/components/templates/custom_scaffold_base.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => const CustomScaffoldBase(),
    );
  }
}
