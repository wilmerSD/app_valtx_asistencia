class ResponseAssistancesMonthUserModel {
    bool success;
    int statusCode;
    String statusMessage;
    List<DatumMonth> data;

    ResponseAssistancesMonthUserModel({
        required this.success,
        required this.statusCode,
        required this.statusMessage,
        required this.data,
    });

    factory ResponseAssistancesMonthUserModel.fromJson(Map<String, dynamic> json) => ResponseAssistancesMonthUserModel(
        success: json["success"]??'',
        statusCode: json["status_code"]??'',
        statusMessage: json["status_message"]??'',
        data: List<DatumMonth>.from(json["data"].map((x) => DatumMonth.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "status_message": statusMessage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DatumMonth {
    int idUser;
    int idValidation;
    String description;
    int quantity;

    DatumMonth({
        required this.idUser,
        required this.idValidation,
        required this.description,
        required this.quantity,
    });

    factory DatumMonth.fromJson(Map<String, dynamic> json) => DatumMonth(
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