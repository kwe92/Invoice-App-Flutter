import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/domain/filter_button_model.dart';
import 'package:provider/provider.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) => const DropdownButtonExample();
}

class DropdownButtonExample extends StatelessWidget {
  const DropdownButtonExample({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (BuildContext context, FilterButtonModel model, _) => DropdownButton<String>(
          value: model.dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
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
