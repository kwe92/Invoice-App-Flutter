import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/new_invoice_screen/presentation/submit_button.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/invoice_form_screen.dart';
import 'package:provider/provider.dart';

class NewInvoice extends StatelessWidget {
  const NewInvoice({super.key});

  @override
  Widget build(BuildContext context) => Consumer3(
        builder: (context, BillFromModel billFromModel, BillToModel billToModel,
                ItemListModel itemsModel, child) =>
            const InvoiceFormScreen(),
      );
}
