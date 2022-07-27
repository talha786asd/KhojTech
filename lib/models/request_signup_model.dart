import 'dart:convert';

RequestSignupModel requestSignupModelFromJson(String str) =>
    RequestSignupModel.fromJson(json.decode(str));

String requestSignupModelToJson(RequestSignupModel data) =>
    json.encode(data.toJson());

class RequestSignupModel {
  RequestSignupModel({
    this.email,
    this.name,
    this.password,
    this.phone,
    this.shopName,
    this.shopAddress,
    this.cnic,
    this.cPassword
  });

  String? email;
  String? name;
  String? password;
  String? phone;
  String? shopName;
  String? shopAddress;
  String? cnic;
  String? cPassword;

  factory RequestSignupModel.fromJson(Map<String, dynamic> json) =>
      RequestSignupModel(
        email: json["email"],
        name: json["name"],
        password: json["password"],
        phone: json["phone"],
        shopName: json["shop_name"],
        shopAddress: json["shop_address"],
        cnic: json["cnic"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
        "phone": phone,
        "shop_name": shopName,
        "shop_address": shopAddress,
        "cnic": cnic,
      };
}
