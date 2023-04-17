import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class ViewInvoiceListTile extends StatelessWidget {
  final InvoiceFormModel invoice;

  const ViewInvoiceListTile({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            invoice.billToText['clientName'].toString().trim(),
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
          Gaps.gaph6,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Invoice ${invoice.invoiceId}'),
              Gaps.gapw8,
              _Capsule(
                child: Center(
                  child: Text(
                    invoice.status,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      );
}

class _Capsule extends StatelessWidget {
  final Widget child;
  const _Capsule({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: 75,
        height: 30,
        decoration: BoxDecoration(
          // TODO: Colors from theme
          color: const Color.fromARGB(255, 131, 222, 134),
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      );
}
