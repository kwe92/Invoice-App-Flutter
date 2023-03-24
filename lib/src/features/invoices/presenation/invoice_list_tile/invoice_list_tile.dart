import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/data/invoice.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_body.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class InvoiceListTile extends StatelessWidget {
  final Invoice invoice;
  const InvoiceListTile({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => _ListTilePadded(invoice: invoice);
}

class _ListTilePadded extends StatelessWidget {
  final Invoice invoice;
  const _ListTilePadded({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(
          left: CustomTheme.mainContentPaddingH,
          right: CustomTheme.mainContentPaddingH,
          top: 24.0,
          bottom: 0),
      child: InvoiceListTileBody(invoice: invoice));
}