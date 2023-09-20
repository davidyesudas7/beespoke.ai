import 'package:beespoke_shopping/data/cart_data/cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class CartEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final List<Product> products;

  const CartEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "date": DateFormat('yyyy-MM-dd').format(date),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [id, userId, date, products];
}
