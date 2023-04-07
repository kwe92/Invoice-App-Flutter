import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
import 'package:invoiceapp/src/features/authentication/domain/logged_in_state.dart';
import 'package:invoiceapp/src/features/invoices/domain/invoices_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/shared/services/get_it.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      ),
      ChangeNotifierProvider(
        create: _appState,
      ),
      ChangeNotifierProvider(
        create: _invoicesNotifier,
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

ApplicationState _appState(context) => ApplicationState();

InvoicesModel _invoicesNotifier(context) => InvoicesModel();
