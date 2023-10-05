class ResponseAssistancesWeekUserModel {
    bool success;
    int statusCode;
    String statusMessage;
    List<Datum> data;

    ResponseAssistancesWeekUserModel({
        required this.success,
        required this.statusCode,
        required this.statusMessage,
        required this.data,
    });

    factory ResponseAssistancesWeekUserModel.fromJson(Map<String, dynamic> json) => ResponseAssistancesWeekUserModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "status_message": statusMessage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int idUser;
    dynamic idAddress;
    dynamic address;
    DateTime date;
    String day;
    dynamic time;
    int idTypesMarking;
    int idValidation;
    String validation;

    Datum({
        required this.idUser,
        required this.idAddress,
        required this.address,
        required this.date,
        required this.day,
        required this.time,
        required this.idTypesMarking,
        required this.idValidation,
        required this.validation,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idUser: json["idUser"],
        idAddress: json["idAddress"],
        address: json["address"],
        date: DateTime.parse(json["date"]),
        day: json["day"],
        time: json["time"],
        idTypesMarking: json["idTypesMarking"],
        idValidation: json["idValidation"],
        validation: json["validation"],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "idAddress": idAddress,
        "address": address,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day,
        "time": time,
        "idTypesMarking": idTypesMarking,
        "idValidation": idValidation,
        "validation": validation,
    };
}