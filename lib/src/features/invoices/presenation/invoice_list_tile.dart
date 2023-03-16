import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/invoices/data/invoice.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class InvoiceListTile extends StatelessWidget {
  final Invoice invoice;
  const InvoiceListTile({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => _ListTilePadded(invoice: invoice);
}

class _ListTilePadded extends StatelessWidget {
  final Invoice invoice;
  const _ListTilePadded({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(
          left: CustomTheme.mainContentPadding,
          right: CustomTheme.mainContentPadding,
          top: 24.0,
          bottom: 0),
      child: _ListTile(invoice: invoice));
}

class _ListTile extends StatelessWidget {
  final Invoice invoice;
  const _ListTile({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 142,
        decoration: _boxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _ListTileLeftSide(invoice: invoice),
              const _ListTileRightSide()
            ],
          ),
        ),
      );
}

BoxDecoration _boxDecoration() {
  const double offsetVal = 2;
  const double blur = 12;
  final Color shadowColor = CustomTheme.lightColors['shade2'] as Color;
  return BoxDecoration(
    color: CustomTheme.lightColors['shade3'],
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: shadowColor,
        offset: const Offset(offsetVal, offsetVal),
        blurRadius: blur,
      ),
      BoxShadow(
        color: shadowColor,
        offset: const Offset(offsetVal * -1, offsetVal * -1),
        blurRadius: blur,
      ),
    ],
  );
}

class _ListTileLeftSide extends StatelessWidget {
  final Invoice invoice;
  const _ListTileLeftSide({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> invoceNumber = [
      Text(
        invoice.id.substring(0, 1),
        style: TextStyle(color: CustomTheme.lightColors['shade0']),
      ),
      Text(invoice.id.substring(1))
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: invoceNumber,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Due ${invoice.date.day} ${_getStringMonth(invoice.date.month)} ${invoice.date.year}',
              style: TextStyle(color: CustomTheme.lightColors['shade0']),
            ),
            Gaps.gaph8,
            // TODO: How to convert a double into a currency representation??
            const Text('\$1,800.90'),
          ],
        )
      ],
    );
  }
}

class _ListTileRightSide extends StatelessWidget {
  const _ListTileRightSide({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle nameStyle =
        TextStyle(color: CustomTheme.lightColors['shade0']);
    const double circleSize = 10;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Baki',
              style: nameStyle,
            ),
            Text(
              'Hanma',
              style: nameStyle,
            )
          ],
        ),
        Container(
          height: 46.75,
          width: 108,
          color: const Color.fromARGB(28, 118, 238, 122),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 81, 215, 85),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                Gaps.gapw10,
                const Text(
                  'Pending',
                  style: TextStyle(color: Color.fromARGB(255, 92, 205, 95)),
                )
              ]),
        )
      ],
    );
  }
}

String _getStringMonth(int month) {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  return months.elementAt(month);
}
