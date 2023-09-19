import 'package:beespoke_shopping/application/constants_and_colors.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundcolor,
        appBar: AppBar(
          title: const Text('cart'),
          backgroundColor: kAppbarcolor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.separated(
              itemBuilder: (context, index) => const CartCard(),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: 10),
        ));
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
  });

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
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('title'), Text('quantity'), Text('amount')],
          )
        ],
      ),
    );
  }
}
