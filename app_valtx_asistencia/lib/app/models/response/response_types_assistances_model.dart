class ResponseTypesAssistancesModel { 
    bool success;
    int statusCode;
    String statusMessage;
    List<Datum> data;

    ResponseTypesAssistancesModel({
        required this.success,
        required this.statusCode,
        required this.statusMessage,
        required this.data,
    });

    factory ResponseTypesAssistancesModel.fromJson(Map<String, dynamic> json) => ResponseTypesAssistancesModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
}

class Datum {
    int idTypesMarking;
    String description;

    Datum({
        required this.idTypesMarking,
        required this.description,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idTypesMarking: json["idTypesMarking"],
        description: json["description"],
    );
}
