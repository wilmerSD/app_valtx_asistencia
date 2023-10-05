class ResponseAssistancesMonthUserModel {
    bool success;
    int statusCode;
    String statusMessage;
    List<Datum> data;

    ResponseAssistancesMonthUserModel({
        required this.success,
        required this.statusCode,
        required this.statusMessage,
        required this.data,
    });

    factory ResponseAssistancesMonthUserModel.fromJson(Map<String, dynamic> json) => ResponseAssistancesMonthUserModel(
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
    int idValidation;
    String description;
    int quantity;

    Datum({
        required this.idUser,
        required this.idValidation,
        required this.description,
        required this.quantity,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idUser: json["idUser"],
        idValidation: json["idValidation"],
        description: json["description"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "idValidation": idValidation,
        "description": description,
        "quantity": quantity,
    };
}