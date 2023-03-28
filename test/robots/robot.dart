import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_form_model.dart';
import 'package:provider/provider.dart';
import 'invoice_screen_robot.dart';
import 'new_invoice_screen_robot.dart';

final GoRouter _router = AppRouter.router;

class Robot {
  final WidgetTester tester;
  final InvoiceScreenRobot invoice;
  final NewInvoiceScreenRobot newInvoice;

  Robot({required this.tester})
      : invoice = InvoiceScreenRobot(tester: tester),
        newInvoice = NewInvoiceScreenRobot(tester: tester);

  Future<void> pumpApp() async =>
      await tester.pumpWidget(_invoiceScreen(_router));
}

Widget _invoiceScreen(GoRouter router) => Provider<BillFromModel>(
      create: (BuildContext context) => BillFromModel(),
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
