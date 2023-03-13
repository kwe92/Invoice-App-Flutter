import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/appbar/appbar.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(appBar: _appBar, body: _body),
      );
}

const PreferredSize _appBar = PreferredSize(
  preferredSize: Size.fromHeight(58),
  child: CustomAppBar(),
);

final Widget _body = Padding(
  padding: const EdgeInsets.only(top: 24.0),
  child: Column(
    children: const <Widget>[
      InvoiceScreen(),
    ],
  ),
);
