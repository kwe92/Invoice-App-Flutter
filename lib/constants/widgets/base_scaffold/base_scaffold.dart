import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/appbar/appbar.dart';
import 'package:invoiceapp/theme/theme.dart';

// TODO: Refactor Invoices and NewInvoices to use the same BaseScaffold for appbar nad background

class BaseScaffold extends StatelessWidget {
  final Widget body;
  const BaseScaffold({required this.body, super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            backgroundColor: CustomTheme.lightColors['shade3'],
            appBar: const CustomAppBar(
              preferredSize: CustomTheme.appBarSize,
            ),
            body: body),
      );
}
