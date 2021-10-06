import 'dart:convert';

MainProductModel mainProductModelFromJson(String str) => MainProductModel.fromJson(json.decode(str));

String mainProductModelToJson(MainProductModel data) => json.encode(data.toJson());

class MainProductModel {
  MainProductModel({
    required this.products,
  });

  List<Product> products;

  factory MainProductModel.fromJson(Map<String, dynamic> json) => MainProductModel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.id,
    this.title,
    this.image,
    this.bgStatus,
    this.subText,
    this.fullText,
  });

  String? id;
  String? title;
  String? image;
  int? bgStatus;
  String? subText;
  String? fullText;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    bgStatus: json["bg_status"],
    subText: json["sub_text"],
    fullText: json["full_text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "bg_status": bgStatus,
    "sub_text": subText,
    "full_text": fullText,
  };
}