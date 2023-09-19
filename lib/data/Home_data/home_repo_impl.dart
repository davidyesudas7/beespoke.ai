import 'package:beespoke_shopping/core/exceptions.dart';
import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/data/Home_data/data_source/home_remote_data.dart';
import 'package:beespoke_shopping/data/Home_data/home_data_model.dart';
import 'package:beespoke_shopping/domain/home_domain/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class Homerepoimpl implements Homerepo {
  final HomeRemoteData homeRemoteData;

  Homerepoimpl({required this.homeRemoteData});
  @override
  Future<Either<Failure, List<HomeDataModel>>> getproductdata() async {
    try {
      final List<HomeDataModel> result =
          await homeRemoteData.getremoteproductdata();

      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }

  @override
  Future<Either<Failure, List<HomeDataModel>>> getcategorydata(
      String categoryname) async {
    try {
      final List<HomeDataModel> result =
          await homeRemoteData.getremotecategorydata(categoryname);

      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }

  @override
  Future<Either<Failure, List<HomeDataModel>>> getsortdata(
      String categoryname) async {
    try {
      final List<HomeDataModel> result =
          await homeRemoteData.getremotesortdata(categoryname);

      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }
}
