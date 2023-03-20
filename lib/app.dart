import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/appbar/appbar.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            backgroundColor: CustomTheme.lightColors['shade2`'],
            appBar: const CustomAppBar(
              preferredSize: CustomTheme.appBarHeight,
            ),
            body: _body),
      );
}

final Widget _body = Padding(
  padding: const EdgeInsets.only(top: 24.0),
  child: Column(
    children: const <Widget>[
      InvoiceScreen(),
    ],
  ),
);
