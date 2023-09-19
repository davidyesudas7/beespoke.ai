// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);

import 'dart:convert';

import 'package:beespoke_shopping/domain/login_domain/loginentity.dart';
import 'package:equatable/equatable.dart';

Loginmodel loginmodelFromJson(String str) =>
    Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel extends LoginEntity with EquatableMixin {
  @override
  // ignore: overridden_fields
  final String token;

  Loginmodel({
    required this.token,
  }) : super(token: token);

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
