import 'package:beespoke_shopping/application/cart/bloc/cart_bloc.dart';
import 'package:beespoke_shopping/data/cart_data/cart_data_source.dart/cart_remote_data.dart';
import 'package:beespoke_shopping/data/cart_data/cart_repo_impl.dart';
import 'package:beespoke_shopping/domain/cart_domain/cart_repo.dart';
import 'package:beespoke_shopping/domain/cart_domain/cart_uscase.dart';
import 'package:get_it/get_it.dart';
import 'package:beespoke_shopping/application/home/bloc/home_bloc.dart';
import 'package:beespoke_shopping/data/Home_data/data_source/home_remote_data.dart';
import 'package:beespoke_shopping/data/Home_data/home_repo_impl.dart';
import 'package:beespoke_shopping/domain/home_domain/home_repo.dart';
import 'package:beespoke_shopping/domain/home_domain/home_usecase.dart';
import 'package:http/http.dart';

final sl = GetIt.I; // sl = service locator

Future<void> init() async {
  sl.registerFactory(() => HomeBloc(homeUsecase: sl()));
  sl.registerFactory(() => HomeUsecase(homerepo: sl()));
  sl.registerFactory<Homerepo>(() => Homerepoimpl(homeRemoteData: sl()));
  sl.registerFactory<HomeRemoteData>(() => HomeRemoteDataimpl(client: sl()));
  sl.registerFactory(() => Client());
  sl.registerFactory(() => CartBloc(cartUsecase: sl()));
  sl.registerFactory(() => CartUsecase(cartRepo: sl()));
  sl.registerFactory<CartRepo>(() => CartRepoimpl(
        newcartRemoteData: sl(),
      ));

  sl.registerFactory<NewcartRemoteData>(
      () => NewCartRemoteDataimpl(client: sl()));
}
