import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/form_validators.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/custom_text_form_field.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class BillFrom extends StatelessWidget {
  final BillFromModel model;
  final InvoiceFormModel? invoice;
  final GlobalKey<FormState> formState;

  const BillFrom(
      {required this.model, required this.formState, this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final gaph = Gaps.heigth(18);
    const double textInputWidth = 170;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Form(
        key: formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Bill From',
              style: TextStyle(fontSize: 18, color: purple),
            ),
            gaph,
            CustomTextFormField(
              title: 'Street Address',
              controller: model.streetAddController,
              validator: FormValidators.textNumField,
            ),
            gaph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: textInputWidth,
                  child: CustomTextFormField(
                    title: 'City',
                    controller: model.cityController,
                    validator: FormValidators.textField,
                  ),
                ),
                SizedBox(
                  width: textInputWidth,
                  child: CustomTextFormField(
                    title: 'Post Code',
                    controller: model.postCodeController,
                    validator: FormValidators.numberField,
                  ),
                ),
              ],
            ),
            gaph,
            CustomTextFormField(
              title: 'Country',
              controller: model.countryController,
              validator: FormValidators.textField,
            ),
            gaph,
          ],
        ),
      ),
    );
  }
}



// static const formKey = Key('formKey');
// static const streetAddressKey = Key('streetAddressKey');
// static const cityKey = Key('cityKey');
// static const postCodeKey = Key('postCodeKey');
// static const countryKey = Key('countryKey');
// static const clearTextKey = Key('clearTextKey');
