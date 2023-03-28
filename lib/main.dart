import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_form_model.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_to_model.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(ChangeNotifierProvider(
  //   create: _notifier,
  //   child: _child,
  // ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: _billFromNotifier,
      ),
      ChangeNotifierProvider(
        create: _billToNotifier,
      )
    ],
    child: _child,
  ));
}

final _child = MaterialApp.router(
  routerConfig: AppRouter.router,
);
BillFromModel _billFromNotifier(context) => BillFromModel();

BillToModel _billToNotifier(context) => BillToModel();
