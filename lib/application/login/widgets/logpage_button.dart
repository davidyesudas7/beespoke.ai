import 'package:beespoke_shopping/application/constants_and_colors.dart';
import 'package:flutter/material.dart';

class LogPageButton extends StatelessWidget {
  const LogPageButton({super.key, required this.ontap, required this.name});
  final Function() ontap;
  final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: 150,
        decoration:
            BoxDecoration(color: kBluecolor800, borderRadius: kBorderradius20),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                color: kWhitecolor, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
