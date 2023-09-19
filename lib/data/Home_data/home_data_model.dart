// To parse this JSON data, do
//
//     final homeDataModel = homeDataModelFromJson(jsonString);

// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:beespoke_shopping/domain/home_domain/home_entity.dart';
import 'package:equatable/equatable.dart';

List<HomeDataModel> homeDataModelFromJson(String str) =>
    List<HomeDataModel>.from(
        json.decode(str).map((x) => HomeDataModel.fromJson(x)));

String homeDataModelToJson(List<HomeDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeDataModel extends HomeEntity with EquatableMixin {
  @override
  final int id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String description;
  @override
  final Category category;
  @override
  final String image;
  @override
  final Rating rating;

  HomeDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  }) : super(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category,
            image: image,
            rating: rating);

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
        "rating": rating.toJson(),
      };
}

enum Category {
  // ignore: constant_identifier_names
  ELECTRONICS,
  // ignore: constant_identifier_names
  JEWELERY,
  // ignore: constant_identifier_names
  MEN_S_CLOTHING,
  // ignore: constant_identifier_names
  WOMEN_S_CLOTHING
}

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
