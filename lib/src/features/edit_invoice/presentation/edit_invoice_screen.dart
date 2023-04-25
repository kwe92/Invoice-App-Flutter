import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/invoice_form_screen.dart';
import 'package:provider/provider.dart';

class EditInvoiceScreen extends StatelessWidget {
  final String docId;
  const EditInvoiceScreen({required this.docId, super.key});
  @override
  Widget build(BuildContext context) => Consumer3(
        builder: (BuildContext context, BillFromModel billFromModel,
                BillToModel billToModel, ItemListModel itemsModel, child) =>
            InvoiceFormScreen(
          docId: docId,
        ),
      );
}
