import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/models/load_form_models.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/modal_button.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class EditModal {
  static void modal(BuildContext context, InvoiceFormModel invoice) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        final buttonStyle = ElevatedButton.styleFrom(
            backgroundColor: CustomTheme.otherColors['purple0']);
        return Container(
          height: 325,
          color: CustomTheme.lightColors['shade3'],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Consumer3(
                  builder: (context,
                          BillFromModel billFromModel,
                          BillToModel billToModel,
                          ItemListModel itemsModel,
                          child) =>
                      ModalButton(
                    text: const Text('Edit Invoice'),
                    style: buttonStyle,
                    onPressed:
                        // TODO: Loading controllers and navigating to the edit screen happens from the invocie screen and view invocie screen so should be shared somehow
                        () {
                      LoadFormControllers.load(context, billFromModel,
                          billToModel, itemsModel, invoice);
                    },
                  ),
                ),
                Gaps.gaph8,
                ModalButton(
                    style: buttonStyle,
                    onPressed: () {
                      context.push('/viewInvoice', extra: invoice);
                      Navigator.pop(context);
                    },
                    text: const Text('View Invoice')),
                Gaps.gaph8,
                ModalButton(
                  style: buttonStyle,
                  text: const Text('Close'),
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
