import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/custom_text_style.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class ViewInvoiceListTile extends StatelessWidget {
  final InvoiceFormModel invoice;
  final VoidCallback onLongPress;

  const ViewInvoiceListTile(
      {required this.invoice, required this.onLongPress, super.key});

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
                  _Capsule(
                    child: Center(
                      child: Text(
                        invoice.status,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}

class _Capsule extends StatelessWidget {
  final Widget child;
  const _Capsule({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: 75,
        height: 30,
        decoration: BoxDecoration(
          // TODO: Colors from theme
          color: const Color.fromARGB(255, 131, 222, 134),
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      );
}
