import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: _notifier,
      child: _child,
    ));

final _child = MaterialApp.router(
  routerConfig: AppRouter.router,
);
BillFromModel _notifier(context) => BillFromModel();
