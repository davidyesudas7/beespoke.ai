import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/domain/home_domain/home_entity.dart';
import 'package:beespoke_shopping/domain/home_domain/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeUsecase {
  final Homerepo homerepo;

  HomeUsecase({required this.homerepo});
  Future<Either<Failure, List<HomeEntity>>> getproductdata() async {
    final produtdatalist = homerepo.getproductdata();
    return produtdatalist;
  }

  Future<Either<Failure, List<HomeEntity>>> getcategorydata(
      String categoryname) async {
    final produtdatalist = homerepo.getcategorydata(categoryname);
    return produtdatalist;
  }

  Future<Either<Failure, List<HomeEntity>>> getsortdata(
      String categoryname) async {
    final produtdatalist = homerepo.getsortdata(categoryname);
    return produtdatalist;
  }
}
