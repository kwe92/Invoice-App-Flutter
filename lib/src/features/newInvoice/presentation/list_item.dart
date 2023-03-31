// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/custom_text_form_field.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:provider/provider.dart';

typedef VoidCallback = Function(int index);

class CustomListItem extends StatelessWidget {
  final int index;
  final VoidCallback onPress;
  const CustomListItem({required this.index, required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    final gaph = Gaps.heigth(18);
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Consumer(
        builder: (BuildContext context, CustomListItemModel model, _) => Column(
          children: [
            CustomTextFormField(
                title: 'Item Name', controller: model.itemNameController),
            gaph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TextField(
                    title: 'Qty.',
                    controller: model.quantityController,
                    width: 65),
                _TextField(
                    title: 'Price',
                    controller: model.priceController,
                    width: 105),
                _TextField(
                    title: 'Total',
                    controller: model.totalController,
                    width: 152.5),
              ],
            ),
            gaph,
            OutlinedButton(
              onPressed: () {
                onPress(index);
              },
              child: const Text('Remove Item'),
            )
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final double width;
  final String title;
  final TextEditingController controller;
  const _TextField(
      {required this.title,
      required this.controller,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width,
      child: CustomTextFormField(title: title, controller: controller));
}
