import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';

class CustomTheme {
  const CustomTheme();

  static const double mainContentPaddingH = 18.00;

  static const EdgeInsets mainContentPadding = EdgeInsets.symmetric(horizontal: mainContentPaddingH, vertical: 28);

  static const double appBarHeight = 58;

  static const Size appBarSize = Size.fromHeight(appBarHeight);

  static const ThemeShadesRecord darkColors = (
    shade0: Color.fromRGBO(12, 14, 22, 1),
    shade1: Color.fromRGBO(20, 22, 37, 1),
    shade2: Color.fromRGBO(30, 33, 57, 1),
    shade3: Color.fromRGBO(37, 41, 69, 1),
  );

  static const ThemeShadesRecord lightColors = (
    shade0: Color.fromRGBO(126, 136, 195, 1),
    shade1: Color.fromRGBO(136, 142, 176, 1),
    shade2: Color.fromRGBO(223, 227, 250, 1),
    shade3: Color.fromRGBO(248, 248, 251, 1),
  );

  static const OtherColorsRecord otherColors = (
    purple0: Color.fromRGBO(124, 93, 250, 1),
    purple1: Color.fromRGBO(146, 119, 255, 1),
    red0: Color.fromRGBO(236, 87, 87, 1),
    red1: Color.fromRGBO(255, 151, 151, 1),
    blue0: Color.fromRGBO(18, 103, 177, 1)
  );

// Created a custom MaterColor and can be used anywhere
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
