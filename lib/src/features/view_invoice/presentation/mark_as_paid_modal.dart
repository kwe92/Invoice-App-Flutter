import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/firebase/app_firebase.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';
import 'package:invoiceapp/src/features/shared/widgets/modal_button.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class MarkAsPaidmodal {
  static void modal(BuildContext context, InvoiceFormRecord invoice) => showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          const String pending = 'pending';
          const String paid = 'paid';
          return Container(
            height: 325,
            color: CustomTheme.lightColors.shade3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ModalButton(
                    text: invoice.status == pending ? 'Mark as $paid' : 'Mark as $pending',
                    onPressed: () async {
                      invoice.status == pending
                          ? await AppFirebase.changeStatus(invoice, paid)
                          : await AppFirebase.changeStatus(invoice, pending);
                      context.pushReplacement('/invoices');
                    },
                  ),
                  Gaps.gaph18,
                  ModalButton(
                    text: 'Cancel',
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
