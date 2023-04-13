import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/invoice_form_screen.dart';

// TODO: Make more modular | New Invoice && Edit invoice Screen should be mostly modular | buttons at the bottom may differ

class EditInvoiceScreen extends StatelessWidget {
  final String docId;
  const EditInvoiceScreen({required this.docId, super.key});
  @override
  Widget build(BuildContext context) {
    print('FROM EDIT INVOICE SCREEN: $docId');
    return const InvoiceFormScreen();
  }
}
