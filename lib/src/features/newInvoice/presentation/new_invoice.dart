import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/back_button.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_from.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_to.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class NewInvoice extends StatelessWidget {
  static const baseScaffoldKey = Key('baseScaffoldKey');
  static const backButtonKey = Key('backButtonKey');
  static const billFromKey = Key('billFromKey');

  const NewInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseScaffold(
        key: NewInvoice.baseScaffoldKey,
        body: Padding(
          padding: CustomTheme.mainContentPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                CustomBackButton(),
                Gaps.gaph18,
                _title,
                BillFrom(key: NewInvoice.billFromKey),
                BillTo()
              ],
            ),
          ),
        ),
      );
}

const _title = Text(
  'New Invoice',
  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
);
