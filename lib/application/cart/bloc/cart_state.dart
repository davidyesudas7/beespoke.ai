part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class NewCartAdding extends CartState {}

final class Cartloaded extends CartState {
  final CartEntity cartlist;

  const Cartloaded({required this.cartlist});
  @override
  List<Object> get props => [cartlist];
}

final class NewCartAdded extends CartState {}

final class CartError extends CartState {
  final String error;

  const CartError({required this.error});
}
