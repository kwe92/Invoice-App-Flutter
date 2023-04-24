import 'package:flutter/material.dart';
import 'package:invoiceapp/theme/theme.dart';

typedef VoidCallback = void Function();

typedef StringCallbackVoid = void Function(String);
typedef NullableStringCallback = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final StringCallbackVoid? onChanged;
  final NullableStringCallback? validator;

  const CustomTextFormField(
      {required this.title,
      required this.controller,
      this.readOnly = false,
      this.onTap,
      this.onChanged,
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final grey = CustomTheme.lightColors['shade1'] as Color;
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        focusColor: purple,
        label: Text(
          title,
          style: TextStyle(color: grey),
        ),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: CustomTheme.lightColors['shade1'] as Color),
            borderRadius: BorderRadius.circular(6)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: purple)),
      ),
      validator: validator,
    );
  }
}
