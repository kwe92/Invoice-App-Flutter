import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoiceapp/theme/theme.dart';

class CustomDecoration {
  const CustomDecoration();

  static decoration() {
    const double offsetVal = 2;
    const double blur = 12;
    final Color shadowColor = CustomTheme.lightColors['shade2'] as Color;
    return BoxDecoration(
      color: CustomTheme.lightColors['shade3'],
      borderRadius: BorderRadius.circular(12),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: shadowColor,
          offset: const Offset(offsetVal, offsetVal),
          blurRadius: blur,
        ),
        BoxShadow(
          color: shadowColor,
          offset: const Offset(offsetVal * -1, offsetVal * -1),
          blurRadius: blur,
        ),
      ],
    );
  }
}
