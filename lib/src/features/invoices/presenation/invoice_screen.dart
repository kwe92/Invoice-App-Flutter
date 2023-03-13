import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/src/features/invoices/presenation/titte_icon_list_tile.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

// const double sqrVal = 38;
// const double factor = 2.25;

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(itemCount: 5,itemBuilder:(context, index) => )
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          const TittleIconListTile(),
          for (int i = 0; i < 12; i++) _invoiceListTile()
        ],
      ),
    );
  }
}

Widget _invoiceListTile() {
  const double offsetVal = 2;
  const double blur = 18;
  final shadowColor = CustomTheme.lightColors['shade2'] as Color;
  return Padding(
    // padding:
    //     const EdgeInsets.symmetric(horizontal: CustomTheme.mainContentPadding),
    padding: const EdgeInsets.only(
        left: CustomTheme.mainContentPadding,
        right: CustomTheme.mainContentPadding,
        top: 24.0,
        bottom: 0),
    child: Container(
      height: 142,
      decoration: BoxDecoration(
        color: CustomTheme.lightColors['shade3'],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor,
            offset: const Offset(offsetVal, offsetVal),
            blurRadius: blur,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: shadowColor,
            offset: const Offset(offsetVal * -1, offsetVal * -1),
            blurRadius: blur,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[_listTileLeftSide(), _rightSide()],
      ),
    ),
  );
}

Widget _listTileLeftSide() => Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text('#RT3080'),
        Text('Due 19 Aug 2021'),
        Text('\$1,800.90'),
      ],
    );

Widget _rightSide() {
  const double circleSize = 10;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      const Text('Baki Hanma'),
      Container(
        color: const Color.fromARGB(50, 118, 238, 122),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(children: <Widget>[
            Container(
              width: circleSize,
              height: circleSize,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            Gaps.gapw10,
            const Text('Pending')
          ]),
        ),
      )
    ],
  );
}
