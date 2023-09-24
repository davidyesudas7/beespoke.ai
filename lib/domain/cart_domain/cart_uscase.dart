import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/domain/cart_domain/cart_repo.dart';
import 'package:beespoke_shopping/domain/cart_domain/cartentity.dart';
import 'package:dartz/dartz.dart';

class CartUsecase {
  final CartRepo cartRepo;

  CartUsecase({required this.cartRepo});
  Future<Either<Failure, CartEntity>> addnewcartdata(
      CartEntity cartEntity) async {
    final produtdatalist = cartRepo.addnewcart(cartEntity);
    return produtdatalist;
  }

  Future<Either<Failure, CartEntity>> getcartdata() async {
    final produtdatalist = cartRepo.getnewcart();
    return produtdatalist;
  }
}
