import 'package:flutter/material.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class BillForm extends StatefulWidget {
  const BillForm({super.key});

  @override
  State<BillForm> createState() => _BillFormState();
}

class _BillFormState extends State<BillForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController streetAddController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final grey = CustomTheme.lightColors['shade1'] as Color;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Bill From', style: TextStyle(fontSize: 18, color: purple)),
            Gaps.heigth(24),
            TextFormField(
              controller: streetAddController,
              decoration: InputDecoration(
                label: Text(
                  'Street Address',
                  style: TextStyle(color: grey),
                ),
                // labelText: 'Street Address',
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CustomTheme.lightColors['shade1'] as Color),
                    borderRadius: BorderRadius.circular(6)),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: purple)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
