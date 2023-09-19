import 'package:beespoke_shopping/data/Home_data/home_data_model.dart';
import 'package:beespoke_shopping/core/failures.dart';
import 'package:dartz/dartz.dart';

abstract class Homerepo {
  Future<Either<Failure, List<HomeDataModel>>> getproductdata();
  Future<Either<Failure, List<HomeDataModel>>> getcategorydata(
      String categoryname);
  Future<Either<Failure, List<HomeDataModel>>> getsortdata(String categoryname);
}
