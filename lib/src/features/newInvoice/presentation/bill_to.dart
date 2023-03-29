import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/custom_text_form_field.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

// final _formKey = GlobalKey<FormState>();

class BillTo extends StatelessWidget {
  static const formKey = Key('formKey');
  static const streetAddressKey = Key('streetAddressKey');
  static const cityKey = Key('cityKey');
  static const postCodeKey = Key('postCodeKey');
  static const countryKey = Key('countryKey');
  static const clearTextKey = Key('clearTextKey');
  static const clientNameKey = Key('clientNameKey');
  static const clientEmailKey = Key('clientEmailKey');
  static const projectDescKey = Key('projectDescKey');
  static const dateKey = Key('dateKey');

  final BillToModel model;
  const BillTo({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final gaph = Gaps.heigth(18);
    const double textInputWidth = 170;
    final String initDate = _dateTimeToString(_initDateTime());

    model.setDateControllerText(initDate);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Form(
        key: BillTo.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Bill To', style: TextStyle(fontSize: 18, color: purple)),
            gaph,
            CustomTextFormField(
              key: BillTo.clientNameKey,
              title: "Client's Name",
              controller: model.clientNameController,
            ),
            gaph,
            CustomTextFormField(
              key: BillTo.clientEmailKey,
              title: "Client's Email",
              controller: model.clientEmailController,
            ),
            gaph,
            CustomTextFormField(
              key: BillTo.streetAddressKey,
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
                      key: BillTo.cityKey,
                      title: 'City',
                      controller: model.cityController),
                ),
                SizedBox(
                  width: textInputWidth,
                  child: CustomTextFormField(
                      key: BillTo.postCodeKey,
                      title: 'Post Code',
                      controller: model.postCodeController),
                ),
              ],
            ),
            gaph,
            CustomTextFormField(
                key: BillTo.countryKey,
                title: 'Country',
                controller: model.countryController),
            gaph,
            CustomTextFormField(
              key: BillTo.dateKey,
              title: 'Invoice Date',
              controller: model.dateController,
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: _initDateTime(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(3000),
                );
                if (newDate != null) {
                  model.dateController.text = _dateTimeToString(newDate);
                }
              },
            ),
            gaph,
            CustomTextFormField(
              key: BillTo.projectDescKey,
              title: 'Project Description',
              controller: model.projectDescController,
            ),
            gaph,
          ],
        ),
      ),
    );
  }
}

DateTime _initDateTime() => DateTime(2023);

String _dateTimeToString(DateTime date) =>
    '${date.month.toString()}-${date.day.toString()}-${date.year.toString()}';
