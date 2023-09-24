import 'package:beespoke_shopping/application/cart/bloc/cart_bloc.dart';
import 'package:beespoke_shopping/data/cart_data/cart_model.dart';
import 'package:beespoke_shopping/domain/cart_domain/cartentity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.productid,
  });
  final String title;
  final String image;
  final String description;
  final String price;
  final int productid;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 340,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          Image.network(
            image,
            width: 150,
            height: 150,
          ),
          Text(
            '$price rupees',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          BlocConsumer<CartBloc, CartState>(
            listener: (context, state) {
              if (state is CartError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                          cartEntity: CartEntity(
                              id: productid,
                              userId: 2,
                              date: DateTime.now(),
                              products: [
                            Product(productId: productid, quantity: 1),
                            Product(productId: productid, quantity: 1)
                          ])));
                    },
                    child: const Text('Add To Cart 🛒')),
              );
            },
          )
        ],
      ),
    );
  }
}
