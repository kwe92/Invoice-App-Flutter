import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/utils/random_nums.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/list_item.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class EditModal {
  static void modal(BuildContext context, InvoiceFormModel invoice) {
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
                  builder: (context,
                          BillFromModel billFromModel,
                          BillToModel billToModel,
                          ItemListModel itemsModel,
                          child) =>
                      _ModalButton(
                    text: const Text('Edit Invoice'),
                    onPressed: () {
                      billFromModel.loadControllers(invoice);
                      billToModel.loadControllers(invoice);

                      for (var item in invoice.listItems) {
                        final model = CustomListItemModel();

                        model.loadControllers(item);
                        final String index =
                            RandomRange.integer(1001, 999999).toString();
                        final Map<String, CustomListItemModel> itemModelEntry =
                            {index: model};

                        final listItem = CustomListItem(
                            index: index,
                            onPress: itemsModel.removeItem,
                            listItemModel: model);

                        itemsModel.addItem({index: listItem});
                        itemsModel.addItemModel(itemModelEntry);
                      }

                      print('list items: ${invoice.listItems}');
                      context.push('/editInvoice', extra: invoice.docId);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Gaps.gaph8,
                _ModalButton(
                    onPressed: () {
                      context.push('/viewInvoice');
                      Navigator.pop(context);
                    },
                    text: const Text('View Invoice')),
                Gaps.gaph8,
                _ModalButton(
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

typedef VoidCallback = void Function();

class _ModalButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onPressed;
  const _ModalButton({required this.text, required this.onPressed, super.key});
  static final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: CustomTheme.otherColors['purple0']);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 175,
        child: ElevatedButton(
            style: buttonStyle, onPressed: onPressed, child: text),
      );
}
