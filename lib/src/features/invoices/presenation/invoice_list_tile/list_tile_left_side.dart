import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/formatters.dart';
import 'package:invoiceapp/src/features/invoices/data/invoice.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class ListTileLeftSide extends StatelessWidget {
  final InvoiceFormModel invoice;
  const ListTileLeftSide({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(invoice.invoiceId),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Due ${DateFormatter.dateTimeToString(invoice.paymentDue)}',
              style: TextStyle(color: CustomTheme.lightColors['shade0']),
            ),
            Gaps.gaph8,
            Text(invoice.total.toString()),
          ],
        )
      ],
    );
  }
}

// TODO: Fix _invoceNumber

List<Widget> _invoceNumber(InvoiceFormModel invoice) => [
      Text(
        invoice.invoiceId,
        style: TextStyle(color: CustomTheme.lightColors['shade0']),
      ),
      // Text(invoice.id.substring(1))
    ];

String _invoiceAmnt(Invoice invoice) =>
    LocaleFormatter.formatDouble(invoice.invoiceAmnt);

String _getStringMonth(int month) {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  return months.elementAt(month);
}
