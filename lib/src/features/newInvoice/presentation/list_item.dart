// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/custom_text_form_field.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class CustomListItem extends StatefulWidget {
  const CustomListItem({super.key});

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  TextEditingController _priceController = TextEditingController();

  TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final gaph = Gaps.heigth(18);
    return Column(
      children: [
        CustomTextFormField(
            title: 'Item Name', controller: _itemNameController),
        gaph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 65,
                child: CustomTextFormField(
                    title: 'Qty.', controller: _quantityController)),
            SizedBox(
                width: 105,
                child: CustomTextFormField(
                    title: 'Price', controller: _priceController)),
            SizedBox(
                width: 152.5,
                child: CustomTextFormField(
                    title: 'Total', controller: _totalController))
          ],
        )
      ],
    );
  }
}
