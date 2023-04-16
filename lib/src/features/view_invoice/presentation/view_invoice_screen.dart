import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/formatters.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/back_button.dart';
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
            _ListTile(
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

class _ListTile extends StatelessWidget {
  final InvoiceFormModel invoice;

  const _ListTile({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            invoice.billToText['clientName'].toString().trim(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Gaps.gaph6,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Invoice ${invoice.invoiceId}'),
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
        ],
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

class _DescriptionCard extends StatelessWidget {
  final InvoiceFormModel invoice;
  const _DescriptionCard({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      decoration: BoxDecoration(
        border: Border.all(color: CustomTheme.lightColors['shade0'] as Color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Amount due'),
              Gaps.gaph8,
              Text(
                invoice.total.toString(),
              )
            ],
          ),
          _verticalLine(),
          _middleSection(invoice),
          Gaps.gaph12,
          _iconListTile(invoice)
        ],
      ),
    );
  }
}

Widget _verticalLine() => Row(
      children: [
        Expanded(
            child: Container(
          color: CustomTheme.lightColors['shade0'] as Color,
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
            const Text('Issued on'),
            Gaps.gaph6,
            Text(
              DateFormatter.dateTimeToString(invoice.createdAt),
            )
          ],
        )),
        _customContainer(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Due on'),
              Gaps.gaph6,
              Text(invoice.billToText['date'])
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
        const Text('Invoice for'),
        Gaps.gaph10,
        Row(
          children: [
            CircleAvatar(
              child: Text(
                invoice.billToText['clientName']
                    .toString()
                    .trim()
                    .substring(0, 1),
              ),
            ),
            Gaps.gapw6,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invoice.billToText['clientName'].toString().trim(),
                ),
                Gaps.gaph4,
                Text(
                  invoice.billToText['clientEmail'].toString().trim(),
                )
              ],
            )
          ],
        )
      ],
    );

// Widget? _circleAvatar() {
//   return CircleAvatar(child: ,);
// }
