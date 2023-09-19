part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class GetproductEvent extends HomeEvent {}

final class SpecificCategoryEvent extends HomeEvent {
  final String selectedcategory;

  const SpecificCategoryEvent({required this.selectedcategory});
  @override
  List<Object> get props => [selectedcategory];
}

final class SortProductEvent extends HomeEvent {
  final String selectedcategory;

  const SortProductEvent({required this.selectedcategory});
  @override
  List<Object> get props => [selectedcategory];
}
