import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/router/app_router.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_from.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/new_invoice.dart';
import 'package:provider/provider.dart';

final GoRouter _router = AppRouter.router;

class InvoiceScreenRobot {
  final WidgetTester tester;
  const InvoiceScreenRobot({required this.tester});

  Future navigateToInvoiceScreen() async =>
      await tester.pumpWidget(_invoiceScreen(_router));

  Future tapNewInvoiceButton() async {
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

  // TODO: Create NewInvoiceScreen and BillForm Robots

  void findBillForm() {
    final Finder billForm = find.byKey(NewInvoice.billFormKey);
    expect(billForm, findsOneWidget);
  }

  void findBillFormInputs() {
    final streetAddressInput = find.byKey(BillForm.streetAddressKey);
    expect(streetAddressInput, findsOneWidget);

    final cityInput = find.byKey(BillForm.cityKey);
    expect(cityInput, findsOneWidget);

    final postCodeInput = find.byKey(BillForm.postCodeKey);
    expect(postCodeInput, findsOneWidget);

    final countryInput = find.byKey(BillForm.countryKey);
    expect(countryInput, findsOneWidget);
  }

  void tapClearText() {
    final clearInput = find.byKey(BillForm.clearTextKey);
    expect(clearInput, findsOneWidget);
  }

  // Future enterInputText() async {
  //   await tester.enterText(streetAddressInput, '8303 GreatView Dr.');

  //   await tester.enterText(cityInput, 'San Antonio');

  //   await tester.enterText(postCodeInput, '78240');

  //   await tester.enterText(countryInput, 'United States');
  // }

  Widget _invoiceScreen(GoRouter router) => Provider<BillFromModel>(
        create: (BuildContext context) => BillFromModel(),
        child: MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
        ),
      );
}
