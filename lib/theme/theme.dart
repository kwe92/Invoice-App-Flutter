import 'package:flutter/material.dart';

class CustomTheme {
  const CustomTheme();

  static const double mainContentPaddingH = 18.00;

  static const EdgeInsets mainContentPadding = EdgeInsets.symmetric(horizontal: mainContentPaddingH, vertical: 28);

  static const double appBarHeight = 58;

  static const Size appBarSize = Size.fromHeight(appBarHeight);

  static const Map<String, Color> darkColors = {
    'shade0': Color.fromRGBO(12, 14, 22, 1),
    'shade1': Color.fromRGBO(20, 22, 37, 1),
    'shade2': Color.fromRGBO(30, 33, 57, 1),
    'shade3': Color.fromRGBO(37, 41, 69, 1),
  };

  static const Map<String, Color> lightColors = {
    'shade0': Color.fromRGBO(126, 136, 195, 1),
    'shade1': Color.fromRGBO(136, 142, 176, 1),
    'shade2': Color.fromRGBO(223, 227, 250, 1),
    'shade3': Color.fromRGBO(248, 248, 251, 1),
  };

  static const Map<String, Color> otherColors = {
    'purple0': Color.fromRGBO(124, 93, 250, 1),
    'purple1': Color.fromRGBO(146, 119, 255, 1),
    'red0': Color.fromRGBO(236, 87, 87, 1),
    'red1': Color.fromRGBO(255, 151, 151, 1),
    'blue0': Color.fromRGBO(18, 103, 177, 1)
  };
}
