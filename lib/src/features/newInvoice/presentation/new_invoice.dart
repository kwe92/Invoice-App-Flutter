import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/appbar/appbar.dart';
import 'package:invoiceapp/theme/theme.dart';

class NewInvoice extends StatelessWidget {
  const NewInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SafeArea(
          child: Scaffold(
        appBar: CustomAppBar(preferredSize: CustomTheme.appBarHeight),
      ));
}
