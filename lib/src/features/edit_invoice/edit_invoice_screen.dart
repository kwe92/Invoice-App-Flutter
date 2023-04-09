import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class EditInvoiceScreen extends StatelessWidget {
  final InvoiceFormModel invoice;
  const EditInvoiceScreen({required this.invoice, super.key});

  Widget build(BuildContext context) => BaseScaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Edit Invoice Page'),
              Gaps.gaph12,
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Back'),
              )
            ],
          ),
        ),
      );
}
