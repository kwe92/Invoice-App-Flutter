import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/horizontal_line.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/invoice_items_section/items_list_tile.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/invoice_items_section/total_section.dart';
// TODO: Style Items Container and invoice items text

class ItemsSection extends StatelessWidget {
  final InvoiceFormModel invoice;
  const ItemsSection({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    invoice.listItems.forEach(
      (item) => print('FROM ItemsSection: $item'),
    );

    final Iterable<Widget> items = invoice.listItems.map(
      (item) => ItemsListTile(item: item),
    );

    final double total = invoice.listItems
        .map(
          (item) => double.parse(item['total']),
        )
        .reduce((double value, double element) => value + element);

    return Container(
      decoration: CustomDecoration.decoration(),
      child: Column(
        // TODO: Dynamically display items from invoice state
        children: <Widget>[
          ...items,
          const HorizontalLine(),
          TotalSection(total: total),
        ],
      ),
    );
  }
}
