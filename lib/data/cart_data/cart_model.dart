// To parse this JSON data, do
//
//     final cartmodel = cartmodelFromJson(jsonString);

// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:beespoke_shopping/domain/cart_domain/cartentity.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

List<Cartmodel> cartmodelFromJson(String str) =>
    List<Cartmodel>.from(json.decode(str).map((x) => Cartmodel.fromJson(x)));

String cartmodelToJson(List<Cartmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cartmodel extends CartEntity with EquatableMixin {
  @override
  final int id;
  @override
  final int userId;
  @override
  final DateTime date;
  @override
  final List<Product> products;

  Cartmodel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  }) : super(id: id, userId: userId, date: date, products: products);

  factory Cartmodel.fromJson(Map<String, dynamic> json) => Cartmodel(
        id: json["id"] ?? 0,
        userId: json["userId"] ?? 0,
        date: DateTime.parse(json["date"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "date": DateFormat('yyyy-MM-dd').format(date),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int productId;
  final int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"] ?? 0,
        quantity: json["quantity"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
