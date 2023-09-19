//colors
import 'package:flutter/material.dart';

final Color kAppbarcolor = Colors.amber.shade200;
final Color kAppbartextcolor = Colors.blueGrey.shade700;
final Color kBackgroundcolor = Colors.orange.shade50;
const Color kWhitecolor = Colors.white;
final Color kBluecolor800 = Colors.blue.shade800;

// textstyles

final kAppbartextstyle = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, color: kAppbartextcolor);

//spacebox

const kSpaceheight10 = SizedBox(
  height: 10,
);
const kSpacewidth10 = SizedBox(
  width: 10,
);

const kSpaceheight20 = SizedBox(
  height: 20,
);

const kSpacewidth20 = SizedBox(
  width: 20,
);

//texfield border

final kOutlineborder = OutlineInputBorder(
    borderSide: BorderSide.none, borderRadius: kBorderradius25);

//border radius

final kBorderradius20 = BorderRadius.circular(20);
final kBorderradius25 = BorderRadius.circular(25);
final kBorderradius10 = BorderRadius.circular(10);
