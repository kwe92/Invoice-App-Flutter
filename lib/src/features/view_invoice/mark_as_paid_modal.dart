import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/firebase/app_firebase.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class MarkAsPaidmodal {
  static void modal(BuildContext context, InvoiceFormModel invoice) =>
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
                  _ModalButton(
                    text: invoice.status == 'pending'
                        ? const Text('Mark as paid')
                        : const Text('Mark as Pending'),
                    onPressed: () async {
                      invoice.status == 'pending'
                          ? await AppFirebase.changeStatus(invoice, 'paid')
                          : await AppFirebase.changeStatus(invoice, 'pending');
                      context.pushReplacement('/invoices');
                    },
                  ),
                  Gaps.gaph12,
                  _ModalButton(
                    text: const Text('Cancel'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      );
}

typedef VoidCallback = void Function();

class _ModalButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onPressed;
  const _ModalButton({required this.text, required this.onPressed, super.key});
  static final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: CustomTheme.otherColors['blue0']);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 175,
        child: ElevatedButton(
            style: buttonStyle, onPressed: onPressed, child: text),
      );
}
