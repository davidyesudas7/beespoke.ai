// Import necessary dependencies and files
import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/domain/home_domain/home_entity.dart';
import 'package:beespoke_shopping/domain/home_domain/home_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import event and state classes for the HomeBloc
part 'home_event.dart';
part 'home_state.dart';

// Create a HomeBloc class that extends Bloc and handles HomeEvent and HomeState
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Create an instance of the HomeUsecase class
  final HomeUsecase homeUsecase;

  // Initialize the HomeBloc with the HomeLoading state
  HomeBloc({required this.homeUsecase}) : super(HomeLoading()) {
    // Define how the bloc should respond to the GetproductEvent event
    on<GetproductEvent>((event, emit) async {
      // Emit HomeLoading state to indicate that data loading has started
      emit(HomeLoading());

      // Call the getproductdata method from the HomeUsecase
      final productdata = await homeUsecase.getproductdata();

      // Handle the result of the getproductdata method
      productdata.fold(
          // If there is a failure, emit HomeError state with the error message
          (failure) => emit(HomeError(errormessage: _mapfailure(failure))),
          // If successful, emit HomeLoaded state with the product list
          (productlist) => emit(HomeLoaded(productlist: productlist)));
    });

    // Define how the bloc should respond to the SpecificCategoryEvent event
    on<SpecificCategoryEvent>((event, emit) async {
      // Emit HomeLoading state to indicate that data loading has started
      emit(HomeLoading());

      // Call the getcategorydata method from the HomeUsecase
      final categorydata =
          await homeUsecase.getcategorydata(event.selectedcategory);

      // Handle the result of the getcategorydata method
      categorydata.fold(
          // If there is a failure, emit HomeError state with the error message
          (failure) => emit(HomeError(errormessage: _mapfailure(failure))),
          // If successful, emit HomeLoaded state with the product list
          (productlist) => emit(HomeLoaded(productlist: productlist)));
    });

    // Define how the bloc should respond to the SortProductEvent event
    on<SortProductEvent>((event, emit) async {
      // Emit HomeLoading state to indicate that data loading has started
      emit(HomeLoading());

      // Call the getsortdata method from the HomeUsecase
      final categorydata =
          await homeUsecase.getsortdata(event.selectedcategory);

      // Handle the result of the getsortdata method
      categorydata.fold(
          // If there is a failure, emit HomeError state with the error message
          (failure) => emit(HomeError(errormessage: _mapfailure(failure))),
          // If successful, emit HomeLoaded state with the product list
          (productlist) => emit(HomeLoaded(productlist: productlist)));
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
