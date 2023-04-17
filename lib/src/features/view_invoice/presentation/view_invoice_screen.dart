import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/formatters.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/list_tile_decoration.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/back_button.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/view_invoice_list_tile.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

// TODO: Style Description Card

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
            _DescriptionCard(
              invoice: invoice,
            )
          ],
        ),
      ),
    );
  }
}

// TODO: Finish building view invoice screen

class _DescriptionCard extends StatelessWidget {
  final InvoiceFormModel invoice;
  const _DescriptionCard({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      decoration: CustomDecoration.decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(21.25),
              child: _amountDueSection(invoice)),
          _verticalLine(),
          Padding(
            padding: const EdgeInsets.all(21.25),
            child: _middleSection(invoice),
          ),
          // Gaps.gaph12,
          Padding(
            padding:
                const EdgeInsets.only(left: 21.25, bottom: 21.25, right: 21.25),
            child: _iconListTile(invoice),
          )
        ],
      ),
    );
  }
}

Widget _amountDueSection(InvoiceFormModel invoice) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Amount due',
          style: _descriptionCardTitleStyle(),
        ),
        Gaps.gaph12,
        Text(
          '\$${LocaleFormatter.formatDouble(invoice.total)}',
          style: TextStyle(
            color: CustomTheme.otherColors['purple0'],
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );

Widget _verticalLine() => Row(
      children: [
        Expanded(
            child: Container(
          color: const Color.fromRGBO(192, 192, 192, 1),
          // color: CustomTheme.lightColors['shade1'] as Color,
          height: 1,
        )),
      ],
    );

Widget _middleSection(InvoiceFormModel invoice) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _customContainer(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Issued on',
              style: _descriptionCardTitleStyle(),
            ),
            Gaps.gaph12,
            Text(
              DateFormatter.dateTimeToString(invoice.createdAt),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )),
        _customContainer(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Due on',
                style: _descriptionCardTitleStyle(),
              ),
              Gaps.gaph12,
              Text(
                invoice.billToText['date'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        )
      ],
    );

Widget _customContainer(Widget child) => Expanded(
      child: SizedBox(
        child: child,
      ),
    );

Widget _iconListTile(InvoiceFormModel invoice) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Invoice for',
          style: _descriptionCardTitleStyle(),
        ),
        Gaps.gaph12,
        Row(
          children: [
            CircleAvatar(
              radius: 28,
              child: Text(
                invoice.billToText['clientName']
                    .toString()
                    .trim()
                    .substring(0, 1),
              ),
            ),
            Gaps.gapw12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invoice.billToText['clientName'].toString().trim(),
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w500),
                ),
                Gaps.gaph4,
                Text(
                  invoice.billToText['clientEmail'].toString().trim(),
                  style: _descriptionCardTitleStyle(),
                )
              ],
            )
          ],
        )
      ],
    );

TextStyle _descriptionCardTitleStyle() => const TextStyle(
      fontSize: 18.75,
      color: Color.fromRGBO(118, 123, 124, 1),
    );

// Widget? _circleAvatar() {
//   return CircleAvatar(child: ,);
// }
