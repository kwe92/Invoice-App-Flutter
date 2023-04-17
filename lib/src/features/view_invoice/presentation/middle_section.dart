import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/formatters.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/custom_text_style.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class MiddleSection extends StatelessWidget {
  final InvoiceFormModel invoice;
  const MiddleSection({required this.invoice, super.key});
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ExpandedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Issued on',
                  style: CustomTextStyle(),
                ),
                Gaps.gaph12,
                Text(
                  DateFormatter.dateTimeToString(invoice.createdAt),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          _ExpandedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Due on',
                  style: CustomTextStyle(),
                ),
                Gaps.gaph12,
                Text(
                  invoice.billToText['date'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      );
}

class _ExpandedBox extends StatelessWidget {
  final Widget child;
  const _ExpandedBox({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: SizedBox(
          child: child,
        ),
      );
}
