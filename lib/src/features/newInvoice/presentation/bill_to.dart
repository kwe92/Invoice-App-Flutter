import 'dart:math';

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/custom_text_form_field.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/drop_down_menu.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/list_item.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

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
    final textStyle = TextStyle(fontSize: 18, color: purple);
    const double textInputWidth = 170;
    final String initDate = _dateTimeToString(_initDateTime());

    model.setDateControllerText(initDate);

    return Form(
        key: BillTo.formKey,
        child: Consumer(
          builder: (BuildContext context, ItemListModel itemsList, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Bill To', style: textStyle),
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
              CustomDropDownMenu(controller: model.dropDownMenuController),
              gaph,
              CustomTextFormField(
                key: BillTo.projectDescKey,
                title: 'Project Description',
                controller: model.projectDescController,
              ),
              gaph,
              Text(
                'Item List',
                style: textStyle,
              ),
              Column(
                children: [...itemsList.items.values],
              ),
              gaph,
              Row(
                children: [
                  Expanded(child: _AddButton(
                    onPressed: () {
                      final index = _randInt(1001, 999999);
                      final Map<int, CustomListItem> entry = {
                        index: CustomListItem(
                          index: index,
                          onPress: itemsList.removeItem,
                        )
                      };

                      itemsList.addItem(entry);
                    },
                  )),
                ],
              )
            ],
          ),
        ));
  }
}

typedef VoidCallback = Function();

class _AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _AddButton({required this.onPressed, super.key});

  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: const Text('Add Item'));
  }
}

DateTime _initDateTime() => DateTime(2023);

String _dateTimeToString(DateTime date) =>
    '${date.month.toString()}-${date.day.toString()}-${date.year.toString()}';

int _randInt(int min, int max) => min + Random().nextInt((max + 1) - min);
