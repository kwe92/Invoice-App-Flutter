import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/firebase/app_firebase.dart';
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

                    // TODO: Create a model for this Map instead
                    final formData = {
                      'userId': AppFirebase.getCurrentUserId(),
                      'timeStamp': Timestamp.now(),
                      'billToText': billToText,
                      'billFromText': billFromText,
                      'listItems': itemslist
                    };

                    await AppFirebase.loadData('invoices', formData);
                  },
                  child: const Text('Save & Send'),
                )
              ],
            ),
          )),
        ),
      );
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
