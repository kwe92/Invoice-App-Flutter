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
                //TODO: Maybe Restyle vertical line?
                child: Container(
              // color: const Color.fromRGBO(192, 192, 192, 1),
              // color: CustomTheme.lightColors['shade1'] as Color,
              height: 2.5,
            )),
          ],
        ),
      );
}
