import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/firebase/app_firebase.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/modal_button.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class MarkAsPaidmodal {
  static void modal(BuildContext context, InvoiceFormModel invoice) =>
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          final buttonStyle = ElevatedButton.styleFrom(
              backgroundColor: CustomTheme.otherColors['blue0']);
          return Container(
            height: 325,
            color: CustomTheme.lightColors['shade3'],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ModalButton(
                    text: invoice.status == 'pending'
                        ? const Text('Mark as paid')
                        : const Text('Mark as Pending'),
                    style: buttonStyle,
                    onPressed: () async {
                      invoice.status == 'pending'
                          ? await AppFirebase.changeStatus(invoice, 'paid')
                          : await AppFirebase.changeStatus(invoice, 'pending');
                      context.pushReplacement('/invoices');
                    },
                  ),
                  Gaps.gaph12,
                  ModalButton(
                    text: const Text('Cancel'),
                    style: buttonStyle,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
}

typedef VoidCallback = void Function();
