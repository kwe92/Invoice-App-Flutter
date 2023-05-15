// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/form_validators.dart';
import 'package:invoiceapp/src/features/shared/widgets/custom_text_form_field.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/list_item_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

typedef VoidCallback = Function(String index);

class CustomListItem extends StatelessWidget {
  final String index;
  final VoidCallback onPress;
  final CustomListItemModel listItemModel;
  const CustomListItem({required this.index, required this.onPress, required this.listItemModel, super.key});

  @override
  Widget build(BuildContext context) {
    final gaph = Gaps.heigth(18);
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Column(
        children: [
          CustomTextFormField(
            title: 'Item Name',
            controller: listItemModel.itemNameController,
            validator: FormValidators.textField,
          ),
          gaph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TextField(
                title: 'Qty.',
                width: 65,
                controller: listItemModel.quantityController,
                onChanged: _onChanged,
                validator: FormValidators.intField,
              ),
              _TextField(
                title: 'Price',
                width: 105,
                controller: listItemModel.priceController,
                onChanged: _onChanged,
                validator: FormValidators.doubleField,
              ),
              _TextField(
                title: 'Total',
                width: 152.5,
                readOnly: true,
                controller: listItemModel.totalController,
                validator: FormValidators.doubleField,
              ),
            ],
          ),
          gaph,
          OutlinedButton(
            onPressed: () {
              onPress(
                index,
              );
            },
            child: const Text(
              'Remove Item',
            ),
          )
        ],
      ),
    );
  }

  // Used to make the total price | Could be implemented better
  void _onChanged(String text) {
    print('from _onChanged ${text.isEmpty}');
    final qnty = listItemModel.quantityController.text;
    final price = listItemModel.priceController.text;
    if (qnty.isNotEmpty && price.isNotEmpty) {
      listItemModel.setTotalController(qnty, price);
    }
    if (text.isEmpty) {
      listItemModel.clearTotalController();
    }
  }
}

class _TextField extends StatelessWidget {
  final double width;
  final String title;
  final StringCallbackVoid? onChanged;
  final TextEditingController controller;
  final bool readOnly;

  // TODO: Refactor: validator
  final String? Function(String?)? validator;

  const _TextField(
      {required this.title,
      required this.controller,
      required this.width,
      this.readOnly = false,
      this.onChanged,
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: CustomTextFormField(
          title: title,
          controller: controller,
          onChanged: onChanged,
          readOnly: readOnly,
          validator: validator,
        ),
      );
}
