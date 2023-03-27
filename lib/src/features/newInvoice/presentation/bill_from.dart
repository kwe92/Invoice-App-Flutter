import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/custom_text_form_field.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

// final _formKey = GlobalKey<FormState>();

class BillForm extends StatelessWidget {
  static const formKey = Key('formKey');
  static const streetAddressKey = Key('streetAddressKey');
  static const cityKey = Key('cityKey');
  static const postCodeKey = Key('postCodeKey');
  static const countryKey = Key('countryKey');
  static const clearTextKey = Key('clearTextKey');

  const BillForm({super.key});

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final gaph = Gaps.heigth(18);
    const double textInputWidth = 170;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Form(
        key: BillForm.formKey,
        child: Consumer<BillFromModel>(
          builder: (context, billFrom, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Bill From', style: TextStyle(fontSize: 18, color: purple)),
              gaph,
              CustomTextFormField(
                key: BillForm.streetAddressKey,
                title: 'Street Address',
                controller: billFrom.streetAddController,
              ),
              gaph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: textInputWidth,
                    child: CustomTextFormField(
                        key: BillForm.cityKey,
                        title: 'City',
                        controller: billFrom.cityController),
                  ),
                  SizedBox(
                    width: textInputWidth,
                    child: CustomTextFormField(
                        key: BillForm.postCodeKey,
                        title: 'Post Code',
                        controller: billFrom.postCodeController),
                  ),
                ],
              ),
              gaph,
              CustomTextFormField(
                  key: BillForm.countryKey,
                  title: 'Country',
                  controller: billFrom.countryController),
              gaph,
              OutlinedButton(
                  key: BillForm.clearTextKey,
                  onPressed: () => billFrom.clearAllControllers(),
                  child: const Text('Clear Text'))
            ],
          ),
        ),
      ),
    );
  }
}
