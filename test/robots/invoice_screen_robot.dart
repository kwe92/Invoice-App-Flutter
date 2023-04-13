import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';

class InvoiceScreenRobot {
  final WidgetTester tester;
  const InvoiceScreenRobot({required this.tester});

  Future<void> tapNewInvoiceButton() async {
    final titleIconListTile = find.byKey(InvoiceScreen.titleIconListTileKey);

    expect(titleIconListTile, findsOneWidget);

    final invoiceButton = find.descendant(
        of: titleIconListTile,
        matching: find.byKey(TitleIconListTile.newInvoiceButtonKey));

    expect(invoiceButton, findsOneWidget);

    await tester.tap(invoiceButton);

    await tester.pumpAndSettle();
  }

  void findInvoiceScreenBaseLayout() {
    final baseScaffold = find.byKey(InvoiceScreen.baseScaffoldKey);
    expect(baseScaffold, findsOneWidget);

    final listView = find.byKey(InvoiceScreen.listViewKey);
    expect(listView, findsOneWidget);

    final topTile = find.byKey(InvoiceScreen.titleIconListTileKey);
    expect(topTile, findsOneWidget);
  }
}
