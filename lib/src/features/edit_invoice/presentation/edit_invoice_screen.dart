import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/new_invoice_screen/presentation/submit_button.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/invoice_form_screen.dart';
import 'package:provider/provider.dart';

// TODO: Make more modular | New Invoice && Edit invoice Screen should be mostly modular | buttons at the bottom may differ

class EditInvoiceScreen extends StatelessWidget {
  final String docId;
  const EditInvoiceScreen({required this.docId, super.key});
  @override
  Widget build(BuildContext context) {
    // print('FROM EDIT INVOICE SCREEN: $docId');
    return Consumer3(
        builder: (context, BillFromModel billFromModel, BillToModel billToModel,
                ItemListModel itemsModel, child) =>
            InvoiceFormScreen(
              button: SubmitButton(
                  firebaseId: docId,
                  billFromModel: billFromModel,
                  billToModel: billToModel,
                  itemsModel: itemsModel),
            ));
  }
}
