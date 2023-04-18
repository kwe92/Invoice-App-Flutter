import 'package:flutter/material.dart';

class CustomTextStyle extends TextStyle {
  const CustomTextStyle();

  @override
  double? get fontSize => 16;

  @override
  Color? get color => const Color.fromRGBO(118, 123, 124, 1);
}
