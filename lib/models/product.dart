import 'dart:convert';

import 'package:khoj_tech/models/variable_product.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
 

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.stockStatus,
    this.categories,
    this.images,
    this.attributes,
    this.relatedIds,
    this.type,
    this.variableProduct
  });

  int? id;
  String? name;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? stockStatus;
  List<Categories>? categories;
  List<Img1>? images;
  List<Attributes>? attributes;
  List<int>? relatedIds;
  String? type;
  VariableProduct? variableProduct;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"] != ""
            ? json["sale_price"]
            : json["regular_price"],
        stockStatus: json["stock_status"],
        type: json["type"],

        categories: List<Categories>.from(
            json["categories"].map((x) => Categories.fromJson(x))),
        images: List<Img1>.from(json["images"].map((x) => Img1.fromJson(x))),
        attributes: List<Attributes>.from(
            json["attributes"].map((x) => Attributes.fromJson(x))),
        relatedIds: json["cross_sell_ids"].cast<int>(),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //       "description": description,
  //       "short_description": shortDescription,
  //       "sku": sku,
  //       "price": price,
  //       "regular_price": regularPrice,
  //       "sale_price": salePrice,
  //       "stock_status": stockStatus,
  //       "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  //       "images": List<dynamic>.from(images!.map((x) => x.toJson())),
  //     };

  calculateDiscount() {
    double disPercent = 0;
    if(this.regularPrice != ""){
    double regularPrice = double.parse(this.regularPrice!);
    double salePrice =
        this.salePrice != "" ? double.parse(this.salePrice!) : regularPrice;
    double discount = regularPrice - salePrice;
      disPercent = (discount / regularPrice) * 100;
    }
    return disPercent.round();
  }
}

class Categories {
  Categories({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Img1 {
  Img1({
    this.src,
  });

  String? src;

  factory Img1.fromJson(Map<String, dynamic> json) => Img1(
        src: json["src"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
      };
}

class Attributes {
  int? id;
  String? name;
  List<String>? options;

  Attributes({
    this.id,
    this.name,
    this.options,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        id: json["id"],
        name: json["name"],
        options: List<String>.from(json["options"].map((x) => x)),
      );
}
