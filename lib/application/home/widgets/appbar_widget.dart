import 'package:beespoke_shopping/application/cart/cart_page.dart';
import 'package:beespoke_shopping/application/constants_and_colors.dart';
import 'package:beespoke_shopping/application/home/widgets/autocomplete.dart';
import 'package:beespoke_shopping/application/home/widgets/drop_button.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(
          color: kAppbarcolor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 100, left: 10),
                child: Image.asset(
                  'assets/images/beespoke_logo.png',
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: kBorderradius20),
                child: const Center(child: AutocompleteBasicExample()
                    // TextField(
                    //   decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       prefixIcon: Icon(
                    //         Icons.search,
                    //         color: kAppbartextcolor,
                    //       )),
                    // ),
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryButton(),
                  SortButton(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Cart(),
                            ));
                      },
                      child: Text(
                        'cart',
                        style: kAppbartextstyle,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
