import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/invoice_form_screen.dart';

// TODO: Make more modular | New Invoice && Edit invoice Screen should be mostly modular | buttons at the bottom may differ

class EditInvoiceScreen extends StatelessWidget {
  const EditInvoiceScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      // TODO need edit button connected to firebase

      const InvoiceFormScreen(button: Text('A BUTTON GOES HERE!'));
}
