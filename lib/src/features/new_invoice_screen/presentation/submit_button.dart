import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/enums/status.dart';
import 'package:invoiceapp/constants/firebase/app_firebase.dart';
import 'package:invoiceapp/constants/utils/random_nums.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';

class SubmitButton extends StatelessWidget {
  final BillFromModel billFromModel;
  final BillToModel billToModel;
  final ItemListModel itemsModel;
  const SubmitButton(
      {required this.billFromModel,
      required this.billToModel,
      required this.itemsModel,
      super.key});

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: () async {
          final Map<String, String> billFromText =
              billFromModel.allControllerText;

          final Map<String, String> billToText = billToModel.allControllerText;

          final List<Map<String, String>> itemslist = itemsModel
              .itemModels.values
              .map((value) => value.allControllerText)
              .toList();

          final double total = itemsModel.itemModels.values
              .map((value) => double.parse(value.totalController.text))
              .toList()
              .reduce((value, element) => value + element);

          final DateTime createdDate = DateTime.now();

          final String paymentTerm = billToModel.dropDownMenuController.text;

          final formData = InvoiceFormModel(
                  invoiceId: _createId(),
                  userId: AppFirebase.getCurrentUserId(),
                  createdAt: createdDate,
                  paymentDue: _paymentDue(createdDate, paymentTerm),
                  status: InvoiceStatus.pending.name,
                  billFromText: billFromText,
                  billToText: billToText,
                  listItems: itemslist,
                  total: total)
              .toMap();

          await AppFirebase.loadData('invoices', formData);
          billFromModel.clearAllControllers();
          billToModel.clearAllControllers();
          itemsModel.clearItemsState();

          context.pop();
        },
        child: const Text('Save & Send'),
      );
}

int parseInt(String s) => int.parse(s.replaceAll(RegExp(r'[^0-9]'), ''));

DateTime _paymentDue(DateTime date, String paymentTerm) {
  final newDate =
      DateTime(date.year, date.month, date.day + parseInt(paymentTerm));

  return newDate;
}

// Function to generate random ID
String _createId() {
  final alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  final int randIndex1 = RandomRange.integer(0, alphabet.length - 1);
  final int randIndex2 = RandomRange.integer(0, alphabet.length - 1);

  final String firstLetter = alphabet.removeAt(randIndex1);
  final String secondLetter = alphabet.removeAt(randIndex2);
  final String random4numberCombo = RandomRange.integer(1001, 9999).toString();
  const String hash = '#';

  final id = hash + firstLetter + secondLetter + random4numberCombo;

  return id;
}