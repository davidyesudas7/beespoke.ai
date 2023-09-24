// Import necessary dependencies and files
import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/domain/cart_domain/cart_uscase.dart';
import 'package:beespoke_shopping/domain/cart_domain/cartentity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import event and state classes defined in separate files
part 'cart_event.dart';
part 'cart_state.dart';

// Define a CartBloc class that extends the Bloc class
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUsecase cartUsecase;

  // Constructor for the CartBloc, which requires an instance of CartUsecase
  CartBloc({required this.cartUsecase}) : super(CartInitial()) {
    // Define event handlers using the 'on' method

    // Handle the AddToCartEvent
    on<AddToCartEvent>((event, emit) async {
      // Call the 'addnewcartdata' method from 'cartUsecase' and await its result
      final addtocart = await cartUsecase.addnewcartdata(event.cartEntity);

      // Use 'fold' to handle either a Failure or a successful result
      addtocart.fold(
        // Handle the case where there's a failure
        (failure) => emit(CartError(error: _mapfailure(failure))),
        // Handle the case where data was added successfully
        (catdata) => emit(NewCartAdded()),
      );
    });

    // Handle the GetcartCartEvent
    on<GetcartCartEvent>((event, emit) async {
      // Call the 'getcartdata' method from 'cartUsecase' and await its result
      final getcart = await cartUsecase.getcartdata();

      // Use 'fold' to handle either a Failure or a successful result
      getcart.fold(
        // Handle the case where there's a failure
        (failure) => emit(CartError(error: _mapfailure(failure))),
        // Handle the case where cart data was retrieved successfully
        (cartlist) => emit(Cartloaded(cartlist: cartlist)),
      );
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
