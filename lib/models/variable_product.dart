import 'dart:convert';

List<VariableProduct> variableProductFromJson(String str) =>
    List<VariableProduct>.from(
        json.decode(str).map((x) => VariableProduct.fromJson(x)));

class VariableProduct {
  int? id;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  List<Attributes>? attributes;

  VariableProduct({
    this.id,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.attributes,
  });

  factory VariableProduct.fromJson(Map<String, dynamic> json) =>
      VariableProduct(
        id: json["id"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        attributes: List<Attributes>.from(
            json["attributes"].map((x) => Attributes.fromJson(x))),
      );
}

class Attributes {
  int? id;
  String? name;
  String? option;

  Attributes({
    this.id,
    this.name,
    this.option,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        id: json["id"],
        name: json["name"],
        option: json["option"],
      );
}
