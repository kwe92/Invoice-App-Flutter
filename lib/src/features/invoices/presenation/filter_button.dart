import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/domain/filter_button_model.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) => const DropdownButtonExample();
}

class DropdownButtonExample extends StatelessWidget {
  const DropdownButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    final Color purple = CustomTheme.otherColors['purple0'] as Color;

    return Consumer(
      builder: (BuildContext context, FilterButtonModel model, _) => DropdownButton<String>(
        value: model.dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: TextStyle(color: purple),
        underline: Container(
          height: 2,
          color: purple,
        ),
        onChanged: (String? value) => model.setValue(value!),
        items: FilterButtonModel.dropdownOptions
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: FittedBox(
                  child: Text(value),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
