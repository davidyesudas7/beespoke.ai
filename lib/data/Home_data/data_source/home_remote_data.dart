import 'dart:developer';

import 'package:beespoke_shopping/core/exceptions.dart';
import 'package:beespoke_shopping/data/Home_data/home_data_model.dart';
import 'package:beespoke_shopping/data/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteData {
  Future<List<HomeDataModel>> getremoteproductdata();
  Future<List<HomeDataModel>> getremotecategorydata(String categoryname);
  Future<List<HomeDataModel>> getremotesortdata(String categoryname);
}

class HomeRemoteDataimpl implements HomeRemoteData {
  final http.Client client;

  HomeRemoteDataimpl({required this.client});
  @override
  Future<List<HomeDataModel>> getremoteproductdata() async {
    final response = await client.get(Uri.parse(producturl));
    debugPrint(response.body);

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final homeDataModel = homeDataModelFromJson(response.body);

      return homeDataModel;
    }
  }

  @override
  Future<List<HomeDataModel>> getremotecategorydata(String categoryname) async {
    log('$categoryurl/$categoryname');
    final response = await client.get(Uri.parse('$categoryurl/$categoryname'));
    debugPrint(response.body);

    if (response.statusCode != 200) {
      debugPrint(response.statusCode.toString());
      throw ServerException();
    } else {
      final homeDataModel = homeDataModelFromJson(response.body);

      return homeDataModel;
    }
  }

  @override
  Future<List<HomeDataModel>> getremotesortdata(String categoryname) async {
    log('$sorturl?sort=$categoryname');
    final response = await client.get(Uri.parse('$sorturl?sort=$categoryname'));
    debugPrint(response.body);

    if (response.statusCode != 200) {
      debugPrint(response.statusCode.toString());
      throw ServerException();
    } else {
      final homeDataModel = homeDataModelFromJson(response.body);

      return homeDataModel;
    }
  }
}
