import 'package:beespoke_shopping/core/exceptions.dart';
import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/data/logindata/datasource/login_to_server.dart';
import 'package:beespoke_shopping/domain/login_domain/LoginRepo.dart';
import 'package:beespoke_shopping/domain/login_domain/loginentity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class LoginRepoimpl implements LoginRepo {
  final LoginToServer loginToServer = LoginToServerimpl();

  LoginRepoimpl();
  @override
  Future<Either<Failure, LoginEntity>> getlogintoken(
      String username, password) async {
    try {
      final result = await loginToServer.getremotelogindata(username, password);

      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }
}
