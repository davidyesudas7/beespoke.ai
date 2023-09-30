// To parse this JSON data, do
//
//     final addcarParams = addcarParamsFromJson(jsonString);

import 'dart:convert';

AddcarParams addcarParamsFromJson(String str) =>
    AddcarParams.fromJson(json.decode(str));

String addcarParamsToJson(AddcarParams data) => json.encode(data.toJson());

class AddcarParams {
  final int userId;
  final DateTime date;
  final List<Addproducts> products;

  AddcarParams({
    required this.userId,
    required this.date,
    required this.products,
  });

  factory AddcarParams.fromJson(Map<String, dynamic> json) => AddcarParams(
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<Addproducts>.from(
            json["products"].map((x) => Addproducts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Addproducts {
  final int productId;
  final int quantity;

  Addproducts({
    required this.productId,
    required this.quantity,
  });

  factory Addproducts.fromJson(Map<String, dynamic> json) => Addproducts(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
