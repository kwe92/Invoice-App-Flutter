import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/src/features/invoices/presenation/titte_icon_list_tile.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

// const double sqrVal = 38;
// const double factor = 2.25;

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[TittleIconListTile()],
    );
  }
}
