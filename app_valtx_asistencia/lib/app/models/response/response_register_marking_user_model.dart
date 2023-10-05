class ResponseRegisterMarkingUserModel {
    bool success;
    int statusCode;
    String statusMessage;
    Data data;

    ResponseRegisterMarkingUserModel({
        required this.success,
        required this.statusCode,
        required this.statusMessage,
        required this.data,
    });

    factory ResponseRegisterMarkingUserModel.fromJson(Map<String, dynamic> json) => ResponseRegisterMarkingUserModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: Data.fromJson(json["data"]),
    );
}

class Data {
    String registradoComo;
    String ubicacin;

    Data({
        required this.registradoComo,
        required this.ubicacin,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        registradoComo: json["Registrado como"],
        ubicacin: json["Ubicación"],
    );
}