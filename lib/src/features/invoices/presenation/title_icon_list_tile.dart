import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/presenation/filter_button.dart';
import 'package:invoiceapp/src/features/invoices/presenation/new_invoice_button.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class TitleIconListTile extends StatelessWidget {
  const TitleIconListTile({super.key});

  @override
  Widget build(BuildContext context) => const NewInvoiceListTile();
}

class NewInvoiceListTile extends StatelessWidget {
  const NewInvoiceListTile({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: CustomTheme.mainContentPadding, vertical: 27.25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _Title(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ...FilterButton.filterButton,
                Gaps.gapw12,
                const NewInvoiceButton(),
              ],
            )
          ],
        ),
      );
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Invoices',
            style: TextStyle(
                fontSize: 24.725,
                fontWeight: FontWeight.w500,
                letterSpacing: -1),
          ),
          Text(
            '7 invocies',
            style: TextStyle(color: CustomTheme.lightColors['shade0']),
          )
        ],
      );
}
