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
    return Column(
      children: <Widget>[const TittleIconListTile(), _invoiceListTile()],
    );
  }
}

Widget _invoiceListTile() {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: CustomTheme.mainContentPadding, vertical: 24.0),
    child: Container(
      height: 132,
      decoration: const BoxDecoration(color: Colors.lightBlue),
    ),
  );
}
