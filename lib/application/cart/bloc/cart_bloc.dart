import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/domain/cart_domain/cart_uscase.dart';
import 'package:beespoke_shopping/domain/cart_domain/cartentity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUsecase cartUsecase;
  CartBloc({required this.cartUsecase}) : super(CartInitial()) {
    on<AddToCartEvent>((event, emit) async {
      final addtocart = await cartUsecase.addnewcartdata(event.cartEntity);
      addtocart.fold((failure) => emit(CartError(error: _mapfailure(failure))),
          (catdata) => emit(NewcartAdded(cartlist: catdata)));
    });

    on<GetcartCartEvent>((event, emit) async {
      final getcart = await cartUsecase.getcartdata();
      getcart.fold((failure) => emit(CartError(error: _mapfailure(failure))),
          (cartlist) => emit(NewcartAdded(cartlist: cartlist)));
    });
  }
  // Helper method to map a Failure object to an error message
  String _mapfailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return kServerfailure;

      case CacheFailure:
        return kCachefailure;

      default:
        return kGenaralfailure;
    }
  }
}
