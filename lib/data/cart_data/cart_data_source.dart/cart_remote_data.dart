import 'dart:convert';
import 'dart:developer';

import 'package:beespoke_shopping/core/exceptions.dart';
import 'package:beespoke_shopping/data/cart_data/cart_model.dart';
import 'package:beespoke_shopping/data/urls.dart';
import 'package:beespoke_shopping/domain/cart_domain/cartentity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class NewcartRemoteData {
  Future<String> addcartoremotedata(CartEntity cartEntity);
  Future<Cartmodel> getcartoremotedata();
}

class NewCartRemoteDataimpl implements NewcartRemoteData {
  final http.Client client;

  NewCartRemoteDataimpl({required this.client});
  @override
  Future<String> addcartoremotedata(CartEntity cartEntity) async {
    log(cartEntity.toJson().toString());
    final response = await client.post(
      Uri.parse(addnewcarturl),
      body: jsonEncode(cartEntity.toJson()),
      headers: {
        'content-type': 'application/json',
      },
    );
    log(response.body);

    if (response.statusCode != 200) {
      debugPrint(response.statusCode.toString());
      throw ServerException();
    } else {
      return 'product is added to cart';
    }
  }

  @override
  Future<Cartmodel> getcartoremotedata() async {
    final response = await client.get(
      Uri.parse('$getcarturl/2'),
    );

    log(response.body);

    if (response.statusCode != 200) {
      debugPrint(response.statusCode.toString());
      throw ServerException();
    } else {
      final loginmodel = cartmodelFromJson(response.body);

      return loginmodel.first;
    }
  }
}
