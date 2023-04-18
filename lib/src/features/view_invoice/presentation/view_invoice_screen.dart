import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/enums/hash_keys.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/back_button.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/custom_text_style.dart';
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
              // TODO: Instatiate Row and create back button edit row
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
              const Text(
                'Invoice Items',
                style: CustomTextStyle(),
              ),
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
  invoice.listItems.forEach((e) => print('FROM _itemsContainer: $e'));
  final Iterable<Widget> items = invoice.listItems.map(
    (e) => _itemsListTile(e),
  );

  final double total = invoice.listItems
      .map(
        (item) => double.parse(item['total']),
      )
      .reduce((double value, double element) => value + element);

  return Container(
    decoration: CustomDecoration.decoration(),
    child: Column(
      // TODO: Dynamically display items from invoice state
      children: <Widget>[
        ...items,
        const HorizontalLine(),
        _totalSection(total),
      ],
    ),
  );
}

Widget _itemsListTile(Map<String, dynamic> item) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item[HashKeys.itemName.name],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gaps.gaph6,
              Text(
                'QTY ${item[HashKeys.quantity.name]} x \$${item[HashKeys.price.name]}',
                style: const CustomTextStyle(),
              )
            ],
          ),
          Text(
            '\$${item[HashKeys.total.name]}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );

Widget _totalSection(total) => Container(
      // TODO: Add Navy Blue to CustomTheme.otherColors

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
          children: <Widget>[
            const Text(
              'Total',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              '\$${total.toString()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
