import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/back_button.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/custom_text_style.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/description_card.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/invoice_items_section/items_section.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/view_invoice_list_tile.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class ViewInvoiceScreen extends StatelessWidget {
  final InvoiceFormModel invoice;
  const ViewInvoiceScreen({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    final gaph = Gaps.heigth(24);
    return BaseScaffold(
      body: Padding(
        padding: CustomTheme.mainContentPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // TODO: Instatiate Row and create back button edit row
              const CustomBackButton(
                showText: false,
              ),
              gaph,
              ViewInvoiceListTile(
                invoice: invoice,
              ),
              gaph,
              DescriptionCard(
                invoice: invoice,
              ),
              gaph,
              const Text(
                'Invoice Items',
                style: CustomTextStyle(),
              ),
              gaph,
              ItemsSection(invoice: invoice)
            ],
          ),
        ),
      ),
    );
  }
}
