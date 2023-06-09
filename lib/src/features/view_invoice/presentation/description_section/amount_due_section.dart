import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/formatters.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/custom_text_style.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class AmountDueSection extends StatelessWidget {
  final InvoiceFormRecord invoice;
  const AmountDueSection({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Amount due',
            style: CustomTextStyle(),
          ),
          Gaps.gaph12,
          Text(
            '\$${LocaleFormatter.formatDouble(invoice.total)}',
            style: TextStyle(
              color: CustomTheme.otherColors.purple0,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      );
}
