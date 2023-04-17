import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/back_button.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/description_card.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/view_invoice_list_tile.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class ViewInvoiceScreen extends StatelessWidget {
  final InvoiceFormModel invoice;
  const ViewInvoiceScreen({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: CustomTheme.mainContentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CustomBackButton(
              showText: false,
            ),
            // TODO: D.R.Y
            Gaps.heigth(24),
            ViewInvoiceListTile(
              invoice: invoice,
            ),
            Gaps.heigth(24),
            DescriptionCard(
              invoice: invoice,
            )
          ],
        ),
      ),
    );
  }
}
