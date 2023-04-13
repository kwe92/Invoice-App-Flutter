import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/utils/random_nums.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/invoices/domain/invoices_model.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_list_tile/invoice_list_tile.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/list_item.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class InvoiceScreen extends StatelessWidget {
  static const baseScaffoldKey = Key('baseScaffoldKey');
  static const titleIconListTileKey = Key('titleIconListTileKey');
  static const listViewKey = Key('listViewKey');

  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) => const BaseScaffold(
      key: InvoiceScreen.baseScaffoldKey, body: _InvoicesListView());
}

// TODO: Needs to be its own widget

class _InvoicesListView extends StatelessWidget {
  const _InvoicesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Consumer(
        builder: (BuildContext context, InvoicesModel model, _) {
          // model.notifyListeners();
          print('Map of invoices: ${model.invoices}');
          return ListView(key: InvoiceScreen.listViewKey, children: <Widget>[
            const TitleIconListTile(
              key: InvoiceScreen.titleIconListTileKey,
            ),
            for (final InvoiceFormModel invoice in model.invoices.values)
              GestureDetector(
                  // TODO: Implement onLong press
                  onLongPress: () {
                    _bottomModal(context, invoice);
                  },
                  child: InvoiceListTile(invoice: invoice)),
          ]);
        },
      ),
    );
  }
}

// TODO: Style and clean up the bottom modal

void _bottomModal(BuildContext context, InvoiceFormModel invoice) {
  final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: CustomTheme.otherColors['purple0']);

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
                    ElevatedButton(
                  style: buttonStyle,
                  child: const Text('Edit Invoice'),
                  onPressed: () {
                    billFromModel.loadControllers(invoice);
                    billToModel.loadControllers(invoice);

                    // TODO: Implement editing items list
                    for (var item in invoice.listItems) {
                      final model = CustomListItemModel();

                      model.loadControllers(item);
                      final String index =
                          RandomRange.integer(1001, 999999).toString();
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

                    print('list items: ${invoice.listItems}');
                    context.push('/editInvoice');
                  },
                ),
              ),
              Gaps.gaph12,
              ElevatedButton(
                style: buttonStyle,
                child: const Text('Close'),
                onPressed: () => context.pop(),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// TODO : Implement Item Model
// class ItemModel {
//   final itemName;
//   final quantity;
//   final price;
//   final total;
//   const ItemModel(
//       {required this.itemName,
//       required this.quantity,
//       required this.price,
//       required this.total});
// }
