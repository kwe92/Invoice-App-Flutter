import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_view.dart';

class InvoiceScreen extends StatelessWidget {
  static const baseScaffoldKey = Key('baseScaffoldKey');
  static const titleIconListTileKey = Key('titleIconListTileKey');
  static const listViewKey = Key('listViewKey');

  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) => const BaseScaffold(
        key: InvoiceScreen.baseScaffoldKey,
        body: InvoicesListView(),
      );
}
