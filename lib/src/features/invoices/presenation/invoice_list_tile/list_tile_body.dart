import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_left_side.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_right_side.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';

class InvoiceListTileBody extends StatelessWidget {
  final InvoiceFormRecord invoice;
  const InvoiceListTileBody({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 142,
        decoration: CustomDecoration.decoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[ListTileLeftSide(invoice: invoice), ListTileRightSide(invoice: invoice)],
          ),
        ),
      );
}
