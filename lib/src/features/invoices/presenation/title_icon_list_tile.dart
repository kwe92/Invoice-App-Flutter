import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/domain/filter_button_model.dart';
import 'package:invoiceapp/src/features/invoices/domain/invoices_model.dart';
import 'package:invoiceapp/src/features/invoices/presenation/filter_button.dart';
import 'package:invoiceapp/src/features/invoices/presenation/new_invoice_button.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class TitleIconListTile extends StatelessWidget {
  const TitleIconListTile({super.key});

  @override
  Widget build(BuildContext context) => const _NewInvoiceListTile();
}

class _NewInvoiceListTile extends StatelessWidget {
  const _NewInvoiceListTile({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
        padding: CustomTheme.mainContentPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Title(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FilterButton(),
                Gaps.gapw12,
                NewInvoiceButton(),
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
            style: TextStyle(fontSize: 24.725, fontWeight: FontWeight.w500, letterSpacing: -1),
          ),
          Consumer2(
            builder: (context, InvoicesModel model, FilterButtonModel filterModel, _) {
              final int invoiceCount = InvoicesModel.getInvoices(filterModel.dropdownValue).length;
              return Text(
                invoiceCount == 1 ? '$invoiceCount invoice' : '$invoiceCount invoices',
                style: TextStyle(color: CustomTheme.lightColors['shade0']),
              );
            },
          )
        ],
      );
}
