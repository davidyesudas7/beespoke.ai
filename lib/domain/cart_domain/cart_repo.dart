import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/domain/cart_domain/cartentity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<Either<Failure, List<CartEntity>>> addnewcart(CartEntity cartEntity);
  Future<Either<Failure, List<CartEntity>>> getnewcart();
}