import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: CustomDecoration.decoration(),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 2.5,
              ),
            ),
          ],
        ),
      );
}
