import 'package:beespoke_shopping/application/home/bloc/home_bloc.dart';
import 'package:beespoke_shopping/application/home/widgets/autocomplete_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutocompleteSearch extends StatelessWidget {
  const AutocompleteSearch({super.key});

  static final List<String> _kOptions = autolist;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        BlocProvider.of<HomeBloc>(context)
            .add(SpecificCategoryEvent(selectedcategory: selection));
        debugPrint('You just selected $selection');
      },
    );
  }
}
