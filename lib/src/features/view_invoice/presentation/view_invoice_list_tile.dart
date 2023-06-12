import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';
import 'package:invoiceapp/src/features/shared/widgets/status_indicator.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/custom_text_style.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class ViewInvoiceListTile extends StatelessWidget {
  final InvoiceFormRecord invoice;
  final VoidCallback onLongPress;

  const ViewInvoiceListTile({required this.invoice, required this.onLongPress, super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onLongPress: onLongPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.gaph6,
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: CustomDecoration.decoration(),
              height: 75,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Invoice ${invoice.invoiceId}',
                    style: const CustomTextStyle(),
                  ),
                  Gaps.gapw8,
                  StatusIndicator(size: 8, status: invoice.status),
                ],
              ),
            ),
          ],
        ),
      );
}
