import 'dart:convert';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Helpers {
  static Future<dynamic> loadJsonAssets(String fileName) async {
    final response = await rootBundle.loadString("assets/json/$fileName");
    return json.decode(response);
  }
/* 
  static String getFormatedDate(
    String? date, {
    String locale = "es",
    bool showTime = false,
  }) {
    if (date == null || date.isEmpty || date == "null") {
      return "Sin fecha de entrega";
    }

    var inputFormat = locale == "es"
        ? DateFormat('yyyy-MM-dd')
        : DateFormat('dd/MM/yyyy hh:mm');
    var inputDate = inputFormat.parse(date); // ?? DateTime.now().toString()
    var outputFormat = locale == "es"
        ? showTime == true
            ? DateFormat('dd/MM/yyyy hh:mm')
            : DateFormat('dd/MM/yyyy')
        : DateFormat('yyyy-MM-dd hh:mm');
    return outputFormat.format(inputDate);
  }

  static String getFormatLetterDate(String date) {
    if (date == "null") return "-";
    DateTime dateTime = DateTime.parse(date);
    String hour = dateTime.hour < 10 ? "0${dateTime.hour}" : "${dateTime.hour}";
    String minute =
        dateTime.minute < 10 ? "0${dateTime.minute}" : "${dateTime.minute}";
    return "${dateTime.day} de ${getMonth(dateTime.month)} del ${dateTime.year}  $hour:$minute";
  }

  static String convertStringYYYYMMDD(String date) {
    if (date.isEmpty) return "";
    List<String> arr = date.split("/");
    String day = arr[0];
    String month = arr[1];
    String year = arr[2];

    String convertDate = "$year/$month/$day";
    return convertDate;
  }

  static String convertStringDDMMYYYY(String date) {
    List<String> arr;

    if (date.contains("-")) {
      arr = date.split("-");
    } else {
      arr = date.split("/");
    }

    if (arr.length < 3) return "";

    String year = arr[0];
    String month = arr[1];
    String day = arr[2];

    String convertDate = "$day/$month/$year";
    return convertDate;
  }

  static String convertDateYYYYMMDD(String date) {
    List<String> arr;

    if (date.contains("-")) {
      arr = date.split("-");
    } else {
      arr = date.split("/");
    }

    if (arr.length < 3) return "";

    String year = arr[0];
    String month = arr[1];
    String day = arr[2];

    String convertDate = "$day-$month-$year";
    return convertDate;
  }

  static String getMonth(int month) {
    String response = "";
    switch (month) {
      case 1:
        response = "Enero";
        break;
      case 2:
        response = "Febrero";
        break;
      case 3:
        response = "Marzo";
        break;
      case 4:
        response = "Abril";
        break;
      case 5:
        response = "Mayo";
        break;
      case 6:
        response = "Junio";
        break;
      case 7:
        response = "Julio";
        break;
      case 8:
        response = "Agosto";
        break;
      case 9:
        response = "Setiembre";
        break;
      case 10:
        response = "Octubre";
        break;
      case 11:
        response = "Noviembre";
        break;
      case 12:
        response = "Diciembre";
        break;
    }
    return response;
  }

  static String getPaymentStatus(String value) {
    switch (value) {
      case "0":
        return "Pendiente";
      case "1":
        return "Completado";
      case "2":
        return "Pagado";
      case "3":
        return "Falsa parada";
      default:
        return "";
    }
  }

  static Color getChipColorpaymentStatus(String value) {
    switch (value) {
      /*  case "0":
        return const Color.fromRGBO(217, 217, 217, 1.0);
      case "1":
        return const Color.fromRGBO(254, 215, 76, 1.0);
      case "2":
        return AppColors.green;
      case "3":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "4":
        return AppColors.red; */

      case "0":
        return const Color.fromRGBO(254, 215, 76, 1.0);
      case "1":
        return AppColors.green;
      case "2":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "3":
        return AppColors.red;
      default:
        return const Color.fromRGBO(217, 217, 217, 1.0);
    }
  }

  static Color getColorTextpaymentStatus(String value) {
    switch (value) {
      case "0":
        return AppColors.black;
      /* case "1":
        return AppColors.black; */
      default:
        return Colors.white;
    }
  }

  static String getTypeOfSale(String value) {
    switch (value) {
      case "1":
        return "Tienda virtual";
      case "2":
        return "Manual";
      default:
        return "";
    }
  }

  static Color getChipColorTypeOfSale(String value) {
    switch (value) {
      case "1":
        return const Color.fromRGBO(170, 131, 255, 1.0);
      case "2":
        return const Color.fromRGBO(217, 217, 217, 1.0);
      default:
        return const Color.fromRGBO(217, 217, 217, 1.0);
    }
  }

  static Color getColorTextTypeOfSale(String value) {
    switch (value) {
      case "1":
        return Colors.white;
      default:
        return AppColors.black;
    }
  }

  static String getStatus(String value) {
    switch (value) {
      case "1":
        return "Pendiente";
      case "2":
        return "Confirmado";
      case "3":
        return "Preparando";
      case "4":
        return "En camino";
      case "5":
        return "Entregado";
      case "6":
        return "Rechazado";
      default:
        return "";
    }
  }

  static Color getChipColorStatus(String value) {
    switch (value) {
      case "1":
        return const Color.fromRGBO(217, 217, 217, 1.0);
      case "2":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "3":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "4":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "5":
        return AppColors.green;
      case "6":
        return AppColors.red;
      default:
        return const Color.fromRGBO(217, 217, 217, 1.0);
    }
  }

  static Color getColorTextStatus(String value) {
    switch (value) {
      case "1":
        return AppColors.black;
      default:
        return Colors.white;
    }
  }

  static void launchWhatsapp(
    BuildContext context, {
    String postalCode = "+51",
    required String phoneNumber,
    required String message,
  }) async {
    var url = Uri.parse(
      "whatsapp://send?phone=$postalCode$phoneNumber&text=$message",
    );

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    }

    /* if (await launchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    } */
  }

  static Future<void> launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
    }
  } */

  static void showSnackBar(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    Get.snackbar(
      "",
      "",
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.red,
      titleText: Text(
        title,
        style: AppTextStyle(context).bold16(color: Colors.white),
      ),
      messageText: Text(
        message,
        style: AppTextStyle(context).medium14(color: Colors.white),
      ),
    );
  }

  static Future<void> getShowModalBS(
    BuildContext context, {
    required String title,
    required Widget content,
  }) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50.w,
                  height: 10.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kRadiusNormal.r),
                      topRight: Radius.circular(kRadiusNormal.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          title,
                          style: AppTextStyle(context).bold16(),
                        ),
                      ),
                      content,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
