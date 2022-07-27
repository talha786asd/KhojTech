import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:khoj_tech/config.dart';
import 'package:khoj_tech/models/category.dart';
import 'package:khoj_tech/models/request_login_model.dart';

import 'package:khoj_tech/models/request_signup_model.dart';
import 'package:khoj_tech/models/response_login_model.dart';
import 'package:khoj_tech/models/response_signup_model.dart';
import 'package:khoj_tech/models/slider_model.dart';

class APIService {
  Future<ResponseSignupModel> postSignup(RequestSignupModel signupModel) async {
    final response = await http.post(
      Uri.parse(Config.signupURL),
      body: jsonEncode(signupModel.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    print(responseSignupModelFromJson(response.body));
    return responseSignupModelFromJson(response.body);
  }

  Future<ResponseLoginModel> postLogin(RequestLoginModel loginModel) async {
    final response = await http.post(
      Uri.parse(Config.loginURL),
      body: jsonEncode(
        loginModel.toJson(),
      ),
      headers: {"Content-Type": "application/json"},
    );

    return responseLoginModelFromJson(
      response.body,
    );
  }

  Future<SliderModel> getSlider() async {
    var response = await http.get(
      Uri.parse(
        Config.sliderURL,
      ),
    );

    return sliderModelFromJson(response.body);
  }

  // Future<List<Category>> getCategories() async {
  //   List<Category> data = <Category>[];

  //   try {
  //     String url = Config.url +
  //         Config.categoriesURL +
  //         "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";

  //     var response = Dio().get(url,
  //     options: Options(
  //       headers: {
  //         HttpHeaders.contentTypeHeader: "application/json",
  //       }
  //     ));
  //     if (response.statusCode == 200) {

  //     }
  //   } catch (e) {}
  // }
  Future<List<Category>> getCategories() async {
    String url = Config.url +
        Config.categoriesURL +
        "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
    var response = await http.get(
      Uri.parse(
        url,
      ),
    );
    return categoryFromJson(
      response.body,
    );
  }
  // Future<ResponseSignupModel> postSignup(RequestSignupModel signupModel) async {
  //   // var authToken = base64.encode(
  //   //   utf8.encode(Config.key + ":" + Config.secret),
  //   // );

  //   var response = await Dio().post(
  //     Config.url + Config.signupURL,
  //     data: signupModel.toJson(),
  //     options: Options(
  //       headers: {
  //        // HttpHeaders.authorizationHeader: 'Basic $authToken',
  //         HttpHeaders.contentTypeHeader: "application/json"
  //       },
  //     ),
  //   );

  //   return responseSignupModelFromJson(response.data);

  //   // final response = await http.post(
  //   //   Uri.parse("https://khoj-tech.com/wp-json/khojapp/v1/khoj_add_user"),
  //   //   body: jsonEncode(signupModel.toJson()),
  //   //   headers: {"Content-Type": "application/json"},
  //   // );
  //   // hideProgress();
  //   // return responseSignupModelFromJson(response.body);
  // }

  // Future<bool> createCustomer(CustomerModel model) async {
  //   var authToken = base64.encode(
  //     utf8.encode(Config.key + ":" + Config.secret),
  //   );
  //   bool ret = false;

  //   try {
  //     var response = await Dio().post(Config.url + Config.customerUrl,
  //         data: model.toJson(),
  //         options: Options(headers: {
  //           HttpHeaders.authorizationHeader: 'Basic $authToken',
  //           HttpHeaders.contentTypeHeader: "application/json"
  //         }));

  //     if (response.statusCode == 201) {
  //       ret = true;
  //     }
  //   } on DioError catch (e) {
  //     if (e.response!.statusCode == 404) {
  //       ret = false;
  //     } else {
  //       ret = false;
  //     }
  //   }
  //   return ret;
  // }

  // Future<LoginResponseModel?> loginCustomer(
  //     String username, String password) async {
  //   LoginResponseModel? model;

  //   try {
  //     var response = await Dio().post(Config.tokenURL,
  //         data: {
  //           "username": username,
  //           "password": password,
  //         },
  //         options: Options(headers: {
  //           HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
  //         }));
  //     if (response.statusCode == 200) {
  //       model = LoginResponseModel.fromJson(response.data);
  //     }
  //   } on DioError catch (e) {
  //     print(e.message);
  //   }
  //   return model;
  // }
}
