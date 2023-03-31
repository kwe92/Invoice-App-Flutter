import 'package:flutter/material.dart';
import 'package:invoiceapp/theme/theme.dart';

typedef VoidCallback = Function();

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  final VoidCallback? onTap;

  const CustomTextFormField(
      {required this.title, required this.controller, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final grey = CustomTheme.lightColors['shade1'] as Color;
    return TextFormField(
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        focusColor: purple,
        // TODO: Make the icon dynamic | State maybe?
        // suffixIcon: GestureDetector(
        //   onTap: () => controller.clear(),
        //   child: const Icon(
        //     Icons.close,
        //   ),
        // ),
        label: Text(
          title,
          style: TextStyle(color: grey),
        ),
        // labelText: 'Street Address',
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: CustomTheme.lightColors['shade1'] as Color),
            borderRadius: BorderRadius.circular(6)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: purple)),
      ),
    );
  }
}
