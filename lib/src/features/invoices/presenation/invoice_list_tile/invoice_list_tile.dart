import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_body.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';
import 'package:invoiceapp/theme/theme.dart';

class InvoiceListTile extends StatelessWidget {
  final InvoiceFormRecord invoice;
  const InvoiceListTile({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => _ListTilePadded(invoice: invoice);
}

class _ListTilePadded extends StatelessWidget {
  final InvoiceFormRecord invoice;
  const _ListTilePadded({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: CustomTheme.mainContentPaddingH,
          right: CustomTheme.mainContentPaddingH,
          top: 24.0,
          bottom: 0,
        ),
        child: InvoiceListTileBody(invoice: invoice),
      );
}
