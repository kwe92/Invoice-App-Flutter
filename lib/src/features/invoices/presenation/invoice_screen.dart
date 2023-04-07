import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/invoices/data/invoice.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/invoice_list_tile.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';

class InvoiceScreen extends StatelessWidget {
  static const baseScaffoldKey = Key('baseScaffoldKey');
  static const titleIconListTileKey = Key('titleIconListTileKey');
  static const listViewKey = Key('listViewKey');

  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) => const BaseScaffold(
      key: InvoiceScreen.baseScaffoldKey, body: _InvoicesListView());
}

// TODO: Needs to be its own widget

class _InvoicesListView extends StatelessWidget {
  const _InvoicesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: ListView(key: InvoiceScreen.listViewKey, children: <Widget>[
        const TitleIconListTile(
          key: InvoiceScreen.titleIconListTileKey,
        ),
        for (int i = 0; i < 12; i++) InvoiceListTile(invoice: _invoice),
      ]),
    );
  }
}

final Invoice _invoice = Invoice(
  id: '#RT3080',
  fname: 'Baki',
  lname: 'Hanma',
  invoiceAmnt: 1800.90,
  invoiceStatus: 'Pending',
  date: DateTime.now(),
);
