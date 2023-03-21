import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/appbar/appbar.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BaseScaffold(body: _body);
}

final Widget _body = Padding(
  padding: const EdgeInsets.only(top: 24.0),
  child: Column(
    children: const <Widget>[
      InvoiceScreen(),
    ],
  ),
);
