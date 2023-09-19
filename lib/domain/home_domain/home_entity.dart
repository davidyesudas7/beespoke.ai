import 'package:beespoke_shopping/data/Home_data/home_data_model.dart';
import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final Category category;
  final String image;
  final Rating rating;

  const HomeEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props =>
      [title, id, price, description, category, image, rating];
}
