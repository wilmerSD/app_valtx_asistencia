class ResponseAuthenticationModel {
	bool success;
	int statusCode;
	String statusMessage;
	Data? data;

	ResponseAuthenticationModel({
		required this.success,
		required this.statusCode,
		required this.statusMessage,
		this.data,
	});

	factory ResponseAuthenticationModel.fromJson(Map<String, dynamic> json) => ResponseAuthenticationModel(
		success: json["success"]??"",
		statusCode: json["status_code"]??"",
		statusMessage: json["status_message"]??"",
		data: json["data"]!=null?Data.fromJson(json["data"]):null,
	);
}

class Data {
	String token;
	Data({
		required this.token,
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
		token: json["token"],
	);
}
