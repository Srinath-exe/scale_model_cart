// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product(
      {required this.name,
      required this.img,
      required this.details,
      required this.price});

  String name;
  List<String> img;
  String details;
  double price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      name: json["name"],
      img: json["img"],
      details: json["details"],
      price: json["price"]);

  Map<String, dynamic> toJson() =>
      {"name": name, "img": img, "price": price, "details": details};
}
