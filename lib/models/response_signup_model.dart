import 'dart:convert';

ResponseSignupModel responseSignupModelFromJson(String str) => ResponseSignupModel.fromJson(json.decode(str));

String responseSignupModelToJson(ResponseSignupModel data) => json.encode(data.toJson());

class ResponseSignupModel {
    ResponseSignupModel({
        this.status,
        this.mess,
    });

    String? status;
    String? mess;

    factory ResponseSignupModel.fromJson(Map<String, dynamic> json) => ResponseSignupModel(
        status: json["status"],
        mess: json["mess"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "mess": mess,
    };
}
