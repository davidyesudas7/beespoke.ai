import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/data/logindata/login_repo_impl.dart';
import 'package:beespoke_shopping/domain/login_domain/LoginRepo.dart';
import 'package:beespoke_shopping/domain/login_domain/loginentity.dart';
import 'package:dartz/dartz.dart';

class LoginUscase {
  final LoginRepo loginRepo = LoginRepoimpl();

  LoginUscase();
  Future<Either<Failure, LoginEntity>> getLogindata(
      String username, password) async {
    final produtdatalist = loginRepo.getlogintoken(username, password);
    return produtdatalist;
  }
}
