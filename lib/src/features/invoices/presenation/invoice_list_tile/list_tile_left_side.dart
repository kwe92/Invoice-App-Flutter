import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/locale_formatter.dart';
import 'package:invoiceapp/src/features/invoices/data/invoice.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class ListTileLeftSide extends StatelessWidget {
  final Invoice invoice;
  const ListTileLeftSide({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> invoceNumber = _invoceNumber(invoice);

    final String invoiceAmnt = _invoiceAmnt(invoice);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: invoceNumber,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Due ${invoice.date.day} ${_getStringMonth(invoice.date.month)} ${invoice.date.year}',
              style: TextStyle(color: CustomTheme.lightColors['shade0']),
            ),
            Gaps.gaph8,
            Text('\$$invoiceAmnt'),
          ],
        )
      ],
    );
  }
}

List<Widget> _invoceNumber(Invoice invoice) => [
      Text(
        invoice.id.substring(0, 1),
        style: TextStyle(color: CustomTheme.lightColors['shade0']),
      ),
      Text(invoice.id.substring(1))
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
