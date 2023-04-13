import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
// import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:provider/provider.dart';
import 'invoice_screen_robot.dart';
import 'new_invoice_screen_robot.dart';

class Robot {
  final WidgetTester tester;
  final InvoiceScreenRobot invoice;
  final NewInvoiceScreenRobot newInvoice;

  Robot({required this.tester})
      : invoice = InvoiceScreenRobot(tester: tester),
        newInvoice = NewInvoiceScreenRobot(tester: tester);

  Future<void> pumpApp() async =>
      await tester.pumpWidget(_invoiceScreen(appRouter.router));

  Future<void> pumpWidget(Widget widget) async =>
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<BillFromModel>(
            create: _billFromNotifier,
          ),
          ChangeNotifierProvider<BillToModel>(
            create: _billToNotifier,
          )
        ],
        child: MaterialApp(home: widget),
      ));
}

Widget _invoiceScreen(GoRouter router) => MultiProvider(
      providers: [
        ChangeNotifierProvider<BillFromModel>(
          create: _billFromNotifier,
        ),
        ChangeNotifierProvider<BillToModel>(
          create: _billToNotifier,
        )
      ],
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );

BillFromModel _billFromNotifier(context) => BillFromModel();

BillToModel _billToNotifier(context) => BillToModel();

// Widget _invoiceScreen(GoRouter router) => Provider<BillFromModel>(
//       create: (BuildContext context) => BillFromModel(),
//       child: MaterialApp.router(
//         routeInformationParser: router.routeInformationParser,
//         routerDelegate: router.routerDelegate,
//       ),
//     );
