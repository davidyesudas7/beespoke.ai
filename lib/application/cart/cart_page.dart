import 'package:beespoke_shopping/application/cart/bloc/cart_bloc.dart';
import 'package:beespoke_shopping/application/constants_and_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(GetcartCartEvent());
    return Scaffold(
        backgroundColor: kBackgroundcolor,
        appBar: AppBar(
          title: const Text('cart'),
          backgroundColor: kAppbarcolor,
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is NewCartAdding) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartError) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is Cartloaded) {
              final date = DateFormat('yyyy-MM-dd').format(state.cartlist.date);
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.separated(
                    itemBuilder: (context, index) => CartCard(
                        quantity:
                            state.cartlist.products[index].quantity.toString(),
                        date: date),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: state.cartlist.products.length),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.quantity,
    required this.date,
  });
  final String quantity;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"))),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mens Casual',
              ),
              Text(
                'quantiy: $quantity',
              ),
              Text('date:$date')
            ],
          ),
        ],
      ),
    );
  }
}
