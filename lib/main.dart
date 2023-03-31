import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/shared/services/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: _billFromNotifier,
      ),
      ChangeNotifierProvider(
        create: _billToNotifier,
      ),
      ChangeNotifierProvider(
        create: _itemListNotifier,
      ),
      ChangeNotifierProvider(
        create: _customListItemModelNotifier,
      )
    ],
    child: _child,
  ));
}

final _child = MaterialApp.router(
  routerConfig: appRouter.router,
);
BillFromModel _billFromNotifier(context) => BillFromModel();

BillToModel _billToNotifier(context) => BillToModel();

ItemListModel _itemListNotifier(context) => ItemListModel();

CustomListItemModel _customListItemModelNotifier(context) =>
    CustomListItemModel();
