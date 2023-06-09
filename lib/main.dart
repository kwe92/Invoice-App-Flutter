import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
import 'package:invoiceapp/src/features/authentication/domain/logged_in_state.dart';
import 'package:invoiceapp/src/features/invoices/domain/filter_button_model.dart';
import 'package:invoiceapp/src/features/invoices/domain/invoices_model.dart';
import 'package:invoiceapp/src/features/shared/services/get_it.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/list_item_model.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  FlutterError.onError = (FlutterErrorDetails errorDetails) => FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(
    MultiProvider(
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
        ),
        ChangeNotifierProvider(
          create: _filterNotifier,
        )
      ],
      child: _child,
    ),
  );
}

final _child = MaterialApp.router(
  theme: ThemeData(
    primarySwatch: appTheme,
  ),
  routerConfig: appRouter.router,
);

final MaterialColor appTheme = CustomTheme.createMaterialColor(CustomTheme.otherColors.purple0);

BillFromModel _billFromNotifier(context) => BillFromModel();

BillToModel _billToNotifier(context) => BillToModel();

ItemListModel _itemListNotifier(context) => ItemListModel();

CustomListItemModel _customListItemModelNotifier(context) => CustomListItemModel();

ApplicationState _appState(context) => ApplicationState();

InvoicesModel _invoicesNotifier(context) => InvoicesModel();

FilterButtonModel _filterNotifier(context) => FilterButtonModel();
