part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<HomeEntity> productlist;

  const HomeLoaded({required this.productlist});
  @override
  List<Object> get props => [productlist];
}

final class HomeError extends HomeState {
  final String errormessage;

  const HomeError({required this.errormessage});
  @override
  List<Object> get props => [errormessage];
}
