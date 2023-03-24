import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'package:invoiceapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('invoice screen load', (tester) async {
    app.main();

    // await tester.pumpWidget(_initalWidget(router));
    await tester.pumpAndSettle();

    final topTile = find.byKey(InvoiceScreen.titleIconListTileKey);
    expect(topTile, findsOneWidget);

    final listView = find.byKey(InvoiceScreen.listViewKey);
    expect(listView, findsOneWidget);

    final baseScaffold = find.byKey(InvoiceScreen.baseScaffoldKey);
    expect(baseScaffold, findsOneWidget);

    final invoiceButton = find.byKey(TitleIconListTile.newInvoiceButtonKey);
    expect(invoiceButton, findsOneWidget);

    await tester.tap(invoiceButton);
    await tester.pumpAndSettle();
  });
}

// final GoRouter router = AppRouter.router;

// Widget _initalWidget(GoRouter router) => Provider<BillFromModel>(
//       create: (BuildContext context) => BillFromModel(),
//       child: MaterialApp.router(
//         routeInformationParser: router.routeInformationParser,
//         routerDelegate: router.routerDelegate,
//       ),
//     );
