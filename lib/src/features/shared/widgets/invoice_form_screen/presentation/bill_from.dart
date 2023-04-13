import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/custom_text_form_field.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class BillFrom extends StatelessWidget {
  static const formKey = Key('formKey');
  static const streetAddressKey = Key('streetAddressKey');
  static const cityKey = Key('cityKey');
  static const postCodeKey = Key('postCodeKey');
  static const countryKey = Key('countryKey');
  static const clearTextKey = Key('clearTextKey');

  final BillFromModel model;
  final InvoiceFormModel? invoice;

  const BillFrom({required this.model, this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final gaph = Gaps.heigth(18);
    const double textInputWidth = 170;

    // if (invoice != null
    //     // TODO: Implement edit
    //     // && model.edit == true
    //     ) {
    //   model.loadControllers(invoice!);
    // }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Form(
        key: BillFrom.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Bill From', style: TextStyle(fontSize: 18, color: purple)),
            gaph,
            CustomTextFormField(
              key: BillFrom.streetAddressKey,
              title: 'Street Address',
              controller: model.streetAddController,
            ),
            gaph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: textInputWidth,
                  child: CustomTextFormField(
                      key: BillFrom.cityKey,
                      title: 'City',
                      controller: model.cityController),
                ),
                SizedBox(
                  width: textInputWidth,
                  child: CustomTextFormField(
                      key: BillFrom.postCodeKey,
                      title: 'Post Code',
                      controller: model.postCodeController),
                ),
              ],
            ),
            gaph,
            CustomTextFormField(
                key: BillFrom.countryKey,
                title: 'Country',
                controller: model.countryController),
            gaph,
          ],
        ),
      ),
    );
  }
}
