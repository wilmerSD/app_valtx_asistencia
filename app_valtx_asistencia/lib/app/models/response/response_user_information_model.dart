class ResponseUserInformationModel {
  bool success;
  int statusCode;
  String statusMessage;
  DataUser data;

  ResponseUserInformationModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseUserInformationModel.fromJson(Map<String, dynamic> json) =>
      ResponseUserInformationModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: DataUser.fromJson(json["data"]),
      );
}

class DataUser {
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

  DataUser({
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

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
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
