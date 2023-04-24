import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/utils/random_nums.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/list_item.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class EditButton extends StatelessWidget {
  final InvoiceFormModel invoice;
  const EditButton({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Consumer3(
        builder: (context, BillFromModel billFromModel, BillToModel billToModel,
                ItemListModel itemsModel, child) =>
            IconButton(
          color: CustomTheme.otherColors['blue0'],
          icon: const Icon(Icons.edit),
          onPressed:
              // TODO: Loading controllers and navigating to the edit screen happens from the invocie screen and view invocie screen so should be shared somehow
              () {
            billFromModel.loadControllers(invoice);
            billToModel.loadControllers(invoice);

            for (var item in invoice.listItems) {
              final model = CustomListItemModel();

              model.loadControllers(item);
              final String index = RandomRange.integer(1001, 999999).toString();
              final Map<String, CustomListItemModel> itemModelEntry = {
                index: model
              };

              final listItem = CustomListItem(
                  index: index,
                  onPress: itemsModel.removeItem,
                  listItemModel: model);

              itemsModel.addItem({index: listItem});
              itemsModel.addItemModel(itemModelEntry);
            }

            print('From: edit button list items: ${invoice.listItems}');
            context.pushReplacement('/editInvoice', extra: invoice.docId);
          },
        ),
      );
}
