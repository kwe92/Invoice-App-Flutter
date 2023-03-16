import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/data/invoice.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_error_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';

final _invoice = Invoice(
  id: '#RT3080',
  fname: 'Baki',
  lname: 'Hanma',
  invoiceAmnt: 1800.90,
  invoiceStatus: 'Pending',
  date: DateTime.now(),
);

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Expanded(child: ListView(children: _screenBody));
}

final _screenBody = <Widget>[
  const TitleIconListTile(),
  for (int i = 0; i < 12; i++) InvoiceListTile(invoice: _invoice),
  const ErrorScreen()
];
