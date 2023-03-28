import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/back_button.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_from.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_to.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

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
              child: Consumer2(
            builder: (context, BillFromModel bfm, BillToModel btm, child) =>
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CustomBackButton(),
                Gaps.gaph18,
                _title,
                BillFrom(model: bfm, key: NewInvoice.billFromKey),
                BillTo(model: btm),
                OutlinedButton(
                    key: BillFrom.clearTextKey,
                    onPressed: () {
                      bfm.clearAllControllers();
                      btm.clearAllControllers();
                    },
                    child: const Text('Clear Text'))
              ],
            ),
          )),
        ),
      );
}

const _title = Text(
  'New Invoice',
  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
);
