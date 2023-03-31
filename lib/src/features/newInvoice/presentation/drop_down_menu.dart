// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/theme/theme.dart';

class CustomDropDownMenu extends StatelessWidget {
  final TextEditingController controller;
  const CustomDropDownMenu({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final grey = CustomTheme.lightColors['shade1'] as Color;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownMenu(
              label: const Text('Payment Terms'),
              width: 352.5,
              controller: controller,
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: _border(grey),
                focusedBorder: _border(purple),
              ),
              dropdownMenuEntries: <String>[
                'Net 1` Day',
                'Net 7 Days',
                'Net 14 Days',
                'Net 30 Days'
              ].map((String value) {
                return DropdownMenuEntry<String>(
                  label: value,
                  value: value,
                );
              }).toList())
        ]);
  }
}

OutlineInputBorder _border(Color color) => OutlineInputBorder(
      borderSide: BorderSide(color: color),
    );
