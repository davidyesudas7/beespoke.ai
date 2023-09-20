part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class AddToCartEvent extends CartEvent {
  final CartEntity cartEntity;
  const AddToCartEvent({
    required this.cartEntity,
  });

  @override
  List<Object> get props => [cartEntity];
}

final class GetcartCartEvent extends CartEvent {}
