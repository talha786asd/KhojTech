import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khoj_tech/config.dart';
import 'package:khoj_tech/models/category.dart';
import 'package:khoj_tech/models/product.dart';
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

  Future<List<Product>> getProducts({
    int? pageNumber,
    int? pageSize,
    String? strSearch,
    String? tagName,
    String? categoryId,
    String? sortBy,
    String sortOrder = 'asc',
  }) async {
    String parameter = '';
    if (strSearch != null) {
      parameter += "&search=$strSearch";
    }
    if (pageSize != null) {
      parameter += "&per_page=$pageSize";
    }
    if (pageNumber != null) {
      parameter += "&page=$pageNumber";
    }
    if (tagName != null) {
      parameter += "&tag=$tagName";
    }
    if (categoryId != null) {
      parameter += "&category=$categoryId";
    }
    if (sortBy != null) {
      parameter += "&orderby=$sortBy";
    }
    if (sortOrder != null) {
      parameter += "&order=$sortOrder";
    }

    // ignore: prefer_interpolation_to_compose_strings
    String url = Config.url +
        Config.productsURL +
        "?consumer_key=${Config.key}&consumer_secret=${Config.secret}${parameter.toString()}";

    var response = await http.get(
      Uri.parse(
        url,
      ),
    );
    return productFromJson(
      response.body,
    );
  }
}
