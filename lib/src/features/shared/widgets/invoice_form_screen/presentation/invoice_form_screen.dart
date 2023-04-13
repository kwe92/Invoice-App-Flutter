// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/back_button.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/bill_from.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/bill_to.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class InvoiceFormScreen extends StatelessWidget {
  static const baseScaffoldKey = Key('baseScaffoldKey');
  static const backButtonKey = Key('backButtonKey');
  static const billFromKey = Key('billFromKey');

  final Widget button;

  const InvoiceFormScreen({required this.button, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseScaffold(
        key: InvoiceFormScreen.baseScaffoldKey,
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
                BillFrom(
                    model: billFromModel, key: InvoiceFormScreen.billFromKey),
                BillTo(
                  model: billToModel,
                  itemsModel: itemsModel,
                ),
                Gaps.gaph12,
                button
              ],
            ),
          )),
        ),
      );
}

int parseInt(String s) => int.parse(s.replaceAll(RegExp(r'[^0-9]'), ''));

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
