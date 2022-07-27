import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(
      json.decode(str).map(
            (x) => Category.fromJson(x),
          ),
    );

class Category {
  int? categoryId;
  String? categoryName;
  String? categoryDesc;
  int? parent;
  Img? image;

  Category({
    this.categoryId,
    this.categoryName,
    this.categoryDesc,
    this.parent,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      categoryId: json["id"],
      categoryName: json["name"],
      categoryDesc: json["description"],
      parent: json["parent"],
      image: Img.fromJson(json['image']));
}

class Img {
  String? url;

  Img({this.url});

  factory Img.fromJson(Map<String, dynamic> json) => Img(url: json['src']);
}
