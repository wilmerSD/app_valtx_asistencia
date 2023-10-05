class ResponseAssistancesDayUserModel {
    bool success;
    int statusCode;
    String statusMessage;
    List<Datum> data;

    ResponseAssistancesDayUserModel({
        required this.success,
        required this.statusCode,
        required this.statusMessage,
        required this.data,
    });

    factory ResponseAssistancesDayUserModel.fromJson(Map<String, dynamic> json) => ResponseAssistancesDayUserModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
}

class Datum {
    String time;
    int idTypesMarking;
    String typesMarking;
    int idValidation;
    String validation;

    Datum({
        required this.time,
        required this.idTypesMarking,
        required this.typesMarking,
        required this.idValidation,
        required this.validation,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        time: json["time"],
        idTypesMarking: json["idTypesMarking"],
        typesMarking: json["typesMarking"],
        idValidation: json["idValidation"],
        validation: json["validation"],
    );
}
