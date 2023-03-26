import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/back_button.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_from.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class NewInvoice extends StatelessWidget {
  static const baseScaffoldKey = Key('baseScaffoldKey');
  static const backButtonKey = Key('backButtonKey');
  static const billFormKey = Key('billFormKey');

  const NewInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseScaffold(
        key: NewInvoice.baseScaffoldKey,
        body: Padding(
          padding: CustomTheme.mainContentPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              CustomBackButton(
                key: NewInvoice.backButtonKey,
              ),
              Gaps.gaph18,
              _title,
              BillForm(key: NewInvoice.billFormKey),
            ],
          ),
        ),
      );
}

const _title = Text(
  'New Invoice',
  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
);
