import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/utils/random_nums.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/list_item.dart';

class LoadFormControllers {
  const LoadFormControllers();

  static void load(
      BuildContext context, BillFromModel billFromModel, BillToModel billToModel, ItemListModel itemsModel, InvoiceFormModel invoice,
      [bool pop = true]) {
    billFromModel.loadControllers(invoice);
    billToModel.loadControllers(invoice);

    for (var item in invoice.listItems) {
      final model = CustomListItemModel();

      model.loadControllers(item);
      final String index = RandomRange.integer(1001, 999999).toString();

      //TODO: create record???
      final Map<String, CustomListItemModel> itemModelEntry = {index: model};

      final listItem = CustomListItem(index: index, onPress: itemsModel.removeItem, listItemModel: model);

      itemsModel.addItem({index: listItem});
      itemsModel.addItemModel(itemModelEntry);
    }

    print('list items: ${invoice.listItems}');
    //TODO: create record???
    context.push('/editInvoice', extra: <String, String>{'docId': invoice.docId, 'invoiceId': invoice.invoiceId});
    pop ? context.pop() : null;
  }
}
