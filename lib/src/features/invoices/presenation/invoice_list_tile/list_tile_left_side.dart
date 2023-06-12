import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/formatters.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class ListTileLeftSide extends StatelessWidget {
  final InvoiceFormRecord invoice;
  const ListTileLeftSide({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Column(
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
              Text('\$${invoice.total.toStringAsFixed(2)}'),
            ],
          )
        ],
      );
}
