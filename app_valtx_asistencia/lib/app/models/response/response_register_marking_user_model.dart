class ResponseRegisterMarkingUserModel {
  bool success;
  int statusCode;
  String statusMessage;
  DataMark data;

  ResponseRegisterMarkingUserModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseRegisterMarkingUserModel.fromJson(
          Map<String, dynamic> json) =>
      ResponseRegisterMarkingUserModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: DataMark.fromJson(json["data"]),
      );
}

class DataMark {
  String registradoComo;
  String ubicacin;

  DataMark({
    required this.registradoComo,
    required this.ubicacin,
  });

  factory DataMark.fromJson(Map<String, dynamic> json) => DataMark(
        registradoComo: json["Registrado como"],
        ubicacin: json["Ubicación"],
      );
}
