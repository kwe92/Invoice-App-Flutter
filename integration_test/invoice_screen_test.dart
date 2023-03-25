import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';

import 'package:invoiceapp/main.dart' as app;
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_from.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/new_invoice.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('invoice screen load', (tester) async {
    app.main();

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

    final baseLayout = find.byKey(NewInvoice.baseScaffoldKey);
    expect(baseLayout, findsOneWidget);

    final billForm = find.byKey(NewInvoice.billFormKey);
    expect(billForm, billForm);

    final streetAddressInput = find.byKey(BillForm.streetAddressKey);
    expect(streetAddressInput, findsOneWidget);

    await _delay(3);
  });
}

Future<Object> _delay(int seconds) =>
    Future.delayed(Duration(seconds: seconds));
