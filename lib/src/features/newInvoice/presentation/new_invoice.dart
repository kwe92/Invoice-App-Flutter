import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/item_list_model.dart';
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
              child: Consumer3(
            builder: (context, BillFromModel billFromModel,
                    BillToModel billToModel, ItemListModel itemsModel, child) =>
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CustomBackButton(),
                Gaps.gaph18,
                const Text(
                  'New Invoice',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                ),
                BillFrom(model: billFromModel, key: NewInvoice.billFromKey),
                BillTo(
                  model: billToModel,
                  itemsModel: itemsModel,
                ),
                // OutlinedButton(
                //   key: BillFrom.clearTextKey,
                //   onPressed: () {
                //     model.clearAllControllers();
                //     btm.clearAllControllers();
                //   },
                //   child: const Text('Clear Text'),
                // ),
                Gaps.gaph12,
                OutlinedButton(
                  onPressed: () {
                    final Map<String, String> billFromText =
                        billFromModel.allControllerText;

                    final Map<String, String> billToText =
                        billToModel.allControllerText;

                    billFromText.forEach((key, value) => print("$key: $value"));
                    billToText.forEach((key, value) => print("$key: $value"));
                    itemsModel.itemModels.forEach((key, value) {
                      final Map<String, String> listItems =
                          value.allControllerText;

                      listItems.forEach((key, value) {
                        print("$key: $value");
                      });
                    });
                  },
                  child: const Text('Save & Send'),
                )
              ],
            ),
          )),
        ),
      );
}
