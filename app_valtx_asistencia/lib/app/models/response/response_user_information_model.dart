
class ResponseUserInformationModel {
    bool success;
    int statusCode;
    String statusMessage;
    Data data;

    ResponseUserInformationModel({
        required this.success,
        required this.statusCode,
        required this.statusMessage,
        required this.data,
    });

    factory ResponseUserInformationModel.fromJson(Map<String, dynamic> json) => ResponseUserInformationModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: Data.fromJson(json["data"]),
    );
}

class Data {
    int idUser;
    String names;
    String lastNames;
    int status;
    String user;
    int idRole;
    int idPrimaryAddress;
    String primaryAddress;
    int idSecondaryAddress;
    String secondaryAddress;

    Data({
        required this.idUser,
        required this.names,
        required this.lastNames,
        required this.status,
        required this.user,
        required this.idRole,
        required this.idPrimaryAddress,
        required this.primaryAddress,
        required this.idSecondaryAddress,
        required this.secondaryAddress,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        idUser: json["idUser"],
        names: json["names"],
        lastNames: json["lastNames"],
        status: json["status"],
        user: json["user"],
        idRole: json["idRole"],
        idPrimaryAddress: json["idPrimaryAddress"],
        primaryAddress: json["primaryAddress"],
        idSecondaryAddress: json["idSecondaryAddress"],
        secondaryAddress: json["secondaryAddress"],
    );

}