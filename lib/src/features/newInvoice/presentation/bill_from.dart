import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/custom_text_form_field.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class BillForm extends StatelessWidget {
  const BillForm({super.key});

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final gaph = Gaps.heigth(24);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Form(
        key: _formKey,
        child: Consumer<BillFromModel>(
          builder: (context, billFrom, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Bill From', style: TextStyle(fontSize: 18, color: purple)),
              gaph,
              CustomTextFormField(
                  title: 'Street Address',
                  controller: billFrom.streetAddController),
              gaph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 165,
                    child: CustomTextFormField(
                        title: 'City', controller: billFrom.cityController),
                  ),
                  SizedBox(
                    width: 165,
                    child: CustomTextFormField(
                        title: 'Post Code',
                        controller: billFrom.postCodeController),
                  ),
                ],
              ),
              gaph,
              CustomTextFormField(
                  title: 'Country', controller: billFrom.countryController),
              OutlinedButton(
                  onPressed: () {
                    _clearButton(billFrom);
                  },
                  child: const Text('Clear Text'))
            ],
          ),
        ),
      ),
    );
  }
}

void _clearButton(BillFromModel model) {
  model.clearCityController();
  model.clearCountryController();
  model.clearPostCodeController();
  model.clearStreetController();
}
