import 'dart:developer';
import 'package:beespoke_shopping/core/exceptions.dart';
import 'package:beespoke_shopping/data/logindata/login_model.dart';
import 'package:beespoke_shopping/data/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class LoginToServer {
  Future<Loginmodel> getremotelogindata(String username, password);
}

class LoginToServerimpl implements LoginToServer {
  final http.Client client = http.Client();

  LoginToServerimpl();
  @override
  Future<Loginmodel> getremotelogindata(String username, password) async {
    final body = {"username": username, "password": password};
    log(body.toString());

    final response = await client.post(
      Uri.parse(loginurl),
      body: body,
    );
    debugPrint(response.body);

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final loginmodel = loginmodelFromJson(response.body);

      return loginmodel;
    }
  }
}
