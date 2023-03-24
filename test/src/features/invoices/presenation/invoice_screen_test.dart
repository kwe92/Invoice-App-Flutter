import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('invoice screen load', (tester) async {
    final GoRouter router = AppRouter.router;

    await tester.pumpWidget(_initalWidget(router));

    final topTile = find.byKey(InvoiceScreen.titleIconListTileKey);
    expect(topTile, findsOneWidget);

    final listView = find.byKey(InvoiceScreen.listViewKey);
    expect(listView, findsOneWidget);

    final baseScaffold = find.byKey(InvoiceScreen.baseScaffoldKey);
    expect(baseScaffold, findsOneWidget);

    final invoiceButton = find.byKey(TitleIconListTile.newInvoiceButtonKey);
    expect(invoiceButton, findsOneWidget);

    await tester.tap(invoiceButton);
    tester.pumpAndSettle();
  });
}

Widget _initalWidget(GoRouter router) => Provider<BillFromModel>(
      create: (BuildContext context) => BillFromModel(),
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
