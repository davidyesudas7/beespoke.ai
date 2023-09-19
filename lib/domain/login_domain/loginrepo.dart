import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/domain/login_domain/loginentity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginEntity>> getlogintoken(String username, password);
}
