

import 'package:beespoke_shopping/core/exceptions.dart';
import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/data/cart_data/cart_data_source.dart/cart_remote_data.dart';
import 'package:beespoke_shopping/domain/cart_domain/cart_repo.dart';
import 'package:beespoke_shopping/domain/cart_domain/cartentity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class CartRepoimpl implements CartRepo {
  final NewcartRemoteData newcartRemoteData;

  CartRepoimpl({required this.newcartRemoteData});
  @override
  Future<Either<Failure, List<CartEntity>>> addnewcart(
      CartEntity cartEntity) async {
    try {
      final result = await newcartRemoteData.addcartoremotedata(cartEntity);

      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralaFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getnewcart() async {
    try {
      final result = await newcartRemoteData.getcartoremotedata();

      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }
}
