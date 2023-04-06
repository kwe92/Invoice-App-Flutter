import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/firebase/app_firebase.dart';
import 'package:invoiceapp/constants/utils/random_nums.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/back_button.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_from.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_to.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class NewInvoice extends StatelessWidget {
  static const baseScaffoldKey = Key('baseScaffoldKey');
  static const backButtonKey = Key('backButtonKey');
  static const billFromKey = Key('billFromKey');

  const NewInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseScaffold(
        key: NewInvoice.baseScaffoldKey,
        body: Padding(
          padding: CustomTheme.mainContentPadding,
          child: SingleChildScrollView(
              child: Consumer3(
            builder: (context, BillFromModel billFromModel,
                    BillToModel billToModel, ItemListModel itemsModel, child) =>
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CustomBackButton(),
                Gaps.gaph18,
                const Text(
                  'New Invoice',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                ),
                BillFrom(model: billFromModel, key: NewInvoice.billFromKey),
                BillTo(
                  model: billToModel,
                  itemsModel: itemsModel,
                ),
                Gaps.gaph12,
                OutlinedButton(
                  onPressed: () async {
                    final Map<String, String> billFromText =
                        billFromModel.allControllerText;

                    final Map<String, String> billToText =
                        billToModel.allControllerText;

                    final List<Map<String, String>> itemslist = itemsModel
                        .itemModels.values
                        .map((value) => value.allControllerText)
                        .toList();

                    final double total = itemsModel.itemModels.values
                        .map(
                            (value) => double.parse(value.totalController.text))
                        .toList()
                        .reduce((value, element) => value + element);

                    final DateTime createdDate = DateTime.now();

                    final String paymentTerm =
                        billToModel.dropDownMenuController.text;

                    // TODO: Create a model for this Map instead
                    final formData = {
                      'invoiceId': _createId(),
                      'userId': AppFirebase.getCurrentUserId(),
                      'createdAt': createdDate,
                      'paymentDue': _paymentDue(createdDate, paymentTerm),
                      'status': 'pending',
                      'billToText': billToText,
                      'billFromText': billFromText,
                      'listItems': itemslist,
                      'total': total
                    };

                    await AppFirebase.loadData('invoices', formData);
                    billFromModel.clearAllControllers();
                    billToModel.clearAllControllers();
                    // TODO: Clear itemsModel controllers
                    // TODO: Create a new empty list of items
                    // itemsModel
                  },
                  child: const Text('Save & Send'),
                )
              ],
            ),
          )),
        ),
      );
}

DateTime _paymentDue(DateTime date, String paymentTerm) {
  final newDate =
      DateTime(date.year, date.month, date.day + parseInt(paymentTerm));

  return newDate;
}

int parseInt(String s) => int.parse(s.replaceAll(RegExp(r'[^0-9]'), ''));

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

// Print All Form Data

  // billFromText.forEach((key, value) => print("$key: $value"));
  //                   billToText.forEach((key, value) => print("$key: $value"));
  //                   itemsModel.itemModels.forEach((key, value) {
  //                     final Map<String, String> listItems =
  //                         value.allControllerText;

  //                     listItems.forEach((key, value) {
  //                       print("$key: $value");
  //                     });
  //                   });
