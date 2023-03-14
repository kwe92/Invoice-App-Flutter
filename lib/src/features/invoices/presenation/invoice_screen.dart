import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/src/features/invoices/data/invoice.dart';
import 'package:invoiceapp/src/features/invoices/presenation/tittle_icon_list_tile.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

// const double sqrVal = 38;
// const double factor = 2.25;

final _invoice = Invoice(
  id: '#RT3080',
  fname: 'Baki',
  lname: 'Hanma',
  invoiceAmnt: 1800.90,
  invoiceStatus: 'Pending',
  date: DateTime.now(),
);

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
  const double blur = 12;
  final shadowColor = CustomTheme.lightColors['shade2'] as Color;
  return Padding(
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
          ),
          BoxShadow(
            color: shadowColor,
            offset: const Offset(offsetVal * -1, offsetVal * -1),
            blurRadius: blur,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_listTileLeftSide(), _rightSide()],
        ),
      ),
    ),
  );
}

Widget _listTileLeftSide() {
  final List<Widget> invoceNumber = [
    Text(
      _invoice.id.substring(0, 1),
      style: TextStyle(color: CustomTheme.lightColors['shade0']),
    ),
    Text(_invoice.id.substring(1))
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
            'Due ${_invoice.date.day} ${_getStringMonth(_invoice.date.month)} ${_invoice.date.year}',
            style: TextStyle(color: CustomTheme.lightColors['shade0']),
          ),
          Gaps.gaph8,
          // TODO: How to convert a duble into a currency representation??
          const Text('\$1,800.90'),
        ],
      )
    ],
  );
}

Widget _rightSide() {
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
