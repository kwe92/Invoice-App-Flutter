import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/domain/invoices_model.dart';
import 'package:invoiceapp/src/features/invoices/presenation/edit_modal.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/invoice_list_tile.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:provider/provider.dart';

class InvoicesListView extends StatelessWidget {
  const InvoicesListView({super.key});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Consumer(
          builder: (BuildContext context, InvoicesModel model, _) => ListView(
            key: InvoiceScreen.listViewKey,
            children: <Widget>[
              const TitleIconListTile(
                key: InvoiceScreen.titleIconListTileKey,
              ),
              for (final InvoiceFormModel invoice in model.invoices.values)
                GestureDetector(
                  onLongPress: () => EditModal.modal(context, invoice),
                  child: InvoiceListTile(invoice: invoice),
                ),
            ],
          ),
        ),
      );
}
