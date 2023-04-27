import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/amount_due_section.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/horizontal_line.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/icon_list_tile.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/middle_section.dart';

class DescriptionCard extends StatelessWidget {
  final InvoiceFormModel invoice;
  const DescriptionCard({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    const double padding = 21.25;
    return Container(
      height: 315,
      decoration: CustomDecoration.decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(padding),
            child: AmountDueSection(invoice: invoice),
          ),
          const HorizontalLine(),
          Padding(
            padding: const EdgeInsets.all(padding),
            child: MiddleSection(invoice: invoice),
          ),
          // Gaps.gaph12,
          Padding(
            padding: const EdgeInsets.only(
                left: padding, bottom: padding, right: padding),
            child: IconListTile(invoice: invoice),
          )
        ],
      ),
    );
  }
}
