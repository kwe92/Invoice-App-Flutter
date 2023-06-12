import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/src/features/shared/models/load_form_models.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/modal_button.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class EditModal {
  static void modal(BuildContext context, InvoiceFormRecord invoice) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 325,
          color: CustomTheme.lightColors['shade3'],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Consumer3(
                  builder: (context, BillFromModel billFromModel, BillToModel billToModel, ItemListModel itemsModel, child) => ModalButton(
                    text: 'Edit Invoice',
                    onPressed: () => LoadFormControllers.load(context, billFromModel, billToModel, itemsModel, invoice),
                  ),
                ),
                Gaps.gaph16,
                ModalButton(
                    onPressed: () {
                      context.push('/viewInvoice', extra: invoice);
                      Navigator.pop(context);
                    },
                    text: 'View Invoice'),
                Gaps.gaph16,
                ModalButton(
                  text: 'Close',
                  onPressed: () => context.pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
