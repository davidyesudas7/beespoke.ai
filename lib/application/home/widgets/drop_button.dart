import 'package:beespoke_shopping/application/constants_and_colors.dart';
import 'package:beespoke_shopping/application/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryButton extends StatelessWidget {
  final List<String> categories = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

  CategoryButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Text(
        'categories',
        style: kAppbartextstyle,
      ),
      itemBuilder: (BuildContext context) {
        return categories.map((String category) {
          return PopupMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList();
      },
      onSelected: (String selectedCategory) {
        BlocProvider.of<HomeBloc>(context)
            .add(SpecificCategoryEvent(selectedcategory: selectedCategory));
        debugPrint('Selected category: $selectedCategory');
      },
    );
  }
}

class SortButton extends StatelessWidget {
  final List<String> categories = [
    'desc',
    'asc',
  ];

  SortButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Text(
        'Sort',
        style: kAppbartextstyle,
      ),
      itemBuilder: (BuildContext context) {
        return categories.map((String category) {
          return PopupMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList();
      },
      onSelected: (String selectedCategory) {
        BlocProvider.of<HomeBloc>(context)
            .add(SortProductEvent(selectedcategory: selectedCategory));
        debugPrint('Selected category: $selectedCategory');
      },
    );
  }
}
