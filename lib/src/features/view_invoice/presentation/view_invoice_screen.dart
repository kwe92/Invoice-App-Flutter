import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/back_button.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/description_card.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/horizontal_line.dart';
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
        child: SingleChildScrollView(
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
              ),
              Gaps.heigth(24),
              const Text('Invoice Items'),
              Gaps.heigth(24),
              _itemsContainer(invoice)
            ],
          ),
        ),
      ),
    );
  }
}

// TODO: Style Items Container and invoice items text

Widget _itemsContainer(InvoiceFormModel invoice) {
  return Container(
    decoration: CustomDecoration.decoration(),
    child: Column(
      // TODO: Dynamically display items from invoice state
      children: <Widget>[
        _itemsListTile(),
        for (var i = 0; i < 2; i++) _itemsListTile(),
        _itemsListTile(),
        const HorizontalLine(),
        Container(
          // TODO: Add Navy Blue to CustomTheme.otherCOlors

          height: 46,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(18, 103, 177, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Total',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '\$9999999',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget _itemsListTile() => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text('Item Name'),
              Gaps.gaph6,
              Text('QTY 3 x \$125')
            ],
          ),
          const Text('375')
        ],
      ),
    );
