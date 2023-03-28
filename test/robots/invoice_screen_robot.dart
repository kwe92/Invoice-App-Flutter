import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/new_invoice.dart';
import 'package:provider/provider.dart';

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

    await tester.pumpWidget(ChangeNotifierProvider<BillFromModel>(
      create: (BuildContext context) => BillFromModel(),
      child: const MaterialApp(home: NewInvoice()),
    ));
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