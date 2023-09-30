import 'package:beespoke_shopping/application/constants_and_colors.dart';
import 'package:beespoke_shopping/application/home/bloc/home_bloc.dart';
import 'package:beespoke_shopping/application/home/widgets/appbar_widget.dart';
import 'package:beespoke_shopping/application/home/widgets/autocomplete_list.dart';

import 'package:beespoke_shopping/application/home/widgets/product_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(GetproductEvent());
    return Scaffold(
      backgroundColor: kBackgroundcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarWidget(),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeError) {
                return Center(
                  child: Text(state.errormessage),
                );
              } else if (state is HomeLoaded) {
                final List category = [
                  "electronics",
                  "jewelery",
                  "men's clothing",
                  "women's clothing"
                ];
                for (var product in state.productlist) {
                  autolist.add(product.title);
                  autolist.add(product.description);
                  debugPrint(product.title);
                }
                for (var categories in category) {
                  autolist.add(categories);
                }

                return Expanded(
                  flex: 3,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ProductCard(
                            title: state.productlist[index].title,
                            image: state.productlist[index].image,
                            description: state.productlist[index].description,
                            price: state.productlist[index].price.toString(),
                            productid: state.productlist[index].id,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: state.productlist.length),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
