import 'dart:ffi';

import 'package:flutter/material.dart';
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
              validator: _FormValidators.textNumField,
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
                    validator: _FormValidators.textField,
                  ),
                ),
                SizedBox(
                  width: textInputWidth,
                  child: CustomTextFormField(
                    title: 'Post Code',
                    controller: model.postCodeController,
                    validator: _FormValidators.numberField,
                  ),
                ),
              ],
            ),
            gaph,
            CustomTextFormField(
              title: 'Country',
              controller: model.countryController,
              validator: _FormValidators.textField,
            ),
            gaph,
          ],
        ),
      ),
    );
  }
}

// TODO: Expand RegEx's

class _FormValidators {
  static const emptyText = 'Can not be empty.';

  static const textNumPattern = '^[a-zA-Z0-9_.- ]*\$';

// TODO: Fix textPattern, its not working correctly. allows user to still inter text with numbers

  static const textPattern = '^[a-zA-Z]';

  static const naturalNumbersPattern = '^[0-9]*\$';

  static final RegExp textNumRegex = RegExp(textNumPattern);
  static final RegExp textRegex = RegExp(textPattern);
  static final RegExp numbersRegex = RegExp(naturalNumbersPattern);

  static String? textNumField(String? s) {
    if (s != null) {
      print('${textNumRegex.hasMatch(s)}');
    }
    if (s == null || s.isEmpty) {
      return emptyText;
    }
    if (!textNumRegex.hasMatch(s)) {
      return 'Can not contain special characters.';
    }
    return null;
  }

  static String? textField(String? s) {
    if (s == null || s.isEmpty) {
      return emptyText;
    }
    if (!textRegex.hasMatch(s)) {
      return 'Please enter a valid value.';
    }
    return null;
  }

  static String? numberField(String? s) {
    if (s == null || s.isEmpty) {
      return emptyText;
    }
    if (!numbersRegex.hasMatch(s)) {
      return 'Enter numbers 0 - 9.';
    }
    return null;
  }
}

// static const formKey = Key('formKey');
// static const streetAddressKey = Key('streetAddressKey');
// static const cityKey = Key('cityKey');
// static const postCodeKey = Key('postCodeKey');
// static const countryKey = Key('countryKey');
// static const clearTextKey = Key('clearTextKey');
