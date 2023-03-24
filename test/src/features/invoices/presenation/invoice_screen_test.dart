import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('invoice screen load', (tester) async {
    await tester.pumpWidget(Provider<BillFromModel>(
      create: (BuildContext context) => BillFromModel(),
      child: const MaterialApp(home: InvoiceScreen()),
    ));

    final topTile = find.byKey(InvoiceScreen.titleIconListTileKey);
    expect(topTile, findsOneWidget);

    final listView = find.byKey(InvoiceScreen.listViewKey);
    expect(listView, findsOneWidget);

    final baseScaffold = find.byKey(InvoiceScreen.baseScaffoldKey);
    expect(baseScaffold, findsOneWidget);
  });
}
