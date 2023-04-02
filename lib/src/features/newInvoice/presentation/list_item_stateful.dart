// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/custom_text_form_field.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

// TODO: Figure out how to remove stateful widget
typedef VoidCallback = Function(int index);

class CustomListItemStateful extends StatefulWidget {
  final int index;
  final VoidCallback onPress;
  const CustomListItemStateful(
      {required this.index, required this.onPress, super.key});

  @override
  State<CustomListItemStateful> createState() => _CustomListItemStatefulState();
}

class _CustomListItemStatefulState extends State<CustomListItemStateful> {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _totalController = TextEditingController();

  TextEditingController get itemNameController => _itemNameController;

  @override
  Widget build(BuildContext context) {
    final gaph = Gaps.heigth(18);
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Column(
        children: [
          CustomTextFormField(
              title: 'Item Name', controller: _itemNameController),
          gaph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TextField(
                  title: 'Qty.', controller: _quantityController, width: 65),
              _TextField(
                  title: 'Price', controller: _priceController, width: 105),
              _TextField(
                  title: 'Total', controller: _totalController, width: 152.5),
            ],
          ),
          gaph,
          OutlinedButton(
            onPressed: () {
              widget.onPress(widget.index);
            },
            child: const Text('Remove Item'),
          )
        ],
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
