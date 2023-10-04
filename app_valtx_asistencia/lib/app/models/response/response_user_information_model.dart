class ResponseUserInformationModel {
	bool success;
	int statusCode;
	String statusMessage;
	List<Data>? data;

	ResponseUserInformationModel({
		required this.success,
		required this.statusCode,
		required this.statusMessage,
		this.data,
	});

	factory ResponseUserInformationModel.fromJson(Map<String, dynamic> json) => ResponseUserInformationModel(
		success: json["success"],
		statusCode: json["status_code"],
		statusMessage: json["status_message"],
		data:json["data"]!=null? List<Data>.from(json["data"].map((x) => Data.fromJson(x),),):null,
	);
}

class Data {
	int idUsuarios;
	String nombres;
	String apellidos;
	int activo;
	String usuario;
	int idRol;
	int idDirec;
	String direccionPrimaria;
	int idDirecSecu;
	String direccionSecundaria;

	Data({
		required this.idUsuarios,
		required this.nombres,
		required this.apellidos,
		required this.activo,
		required this.usuario,
		required this.idRol,
		required this.idDirec,
		required this.direccionPrimaria,
		required this.idDirecSecu,
		required this.direccionSecundaria,
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
		idUsuarios: json["IdUsuarios"],
		nombres: json["Nombres"],
		apellidos: json["Apellidos"],
		activo: json["Activo"],
		usuario: json["Usuario"],
		idRol: json["IdRol"],
		idDirec: json["IdDirec"],
		direccionPrimaria: json["DireccionPrimaria"],
		idDirecSecu: json["IdDirecSecu"],
		direccionSecundaria: json["DireccionSecundaria"],
	);
}
