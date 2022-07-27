import 'dart:convert';

RequestLoginModel requestLoginModelFromJson(String str) => RequestLoginModel.fromJson(json.decode(str));

String requestLoginModelToJson(RequestLoginModel data) => json.encode(data.toJson());

class RequestLoginModel {
    RequestLoginModel({
        this.email,
        this.password,
    });

    String? email;
    String? password;

    factory RequestLoginModel.fromJson(Map<String, dynamic> json) => RequestLoginModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
 