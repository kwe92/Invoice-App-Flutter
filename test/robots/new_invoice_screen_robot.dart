import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceapp/constants/utils/delay.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_from.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/new_invoice.dart';

class NewInvoiceScreenRobot {
  final WidgetTester tester;
  const NewInvoiceScreenRobot({required this.tester});

  void findBillForm() {
    final billForm = find.byKey(NewInvoice.billFormKey);
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

  Future<void> tapClearText() async {
    final clearInput = find.byKey(BillForm.clearTextKey);
    expect(clearInput, findsOneWidget);

    await tester.tap(clearInput);
    await tester.pumpAndSettle();
  }

  Future<void> enterBillFormText() async {
    final streetAddressInput = find.byKey(BillForm.streetAddressKey);
    await tester.enterText(streetAddressInput, '8303 GreatView Dr.');

    final cityInput = find.byKey(BillForm.cityKey);
    await tester.enterText(cityInput, 'San Antonio');

    final postCodeInput = find.byKey(BillForm.postCodeKey);
    await tester.enterText(postCodeInput, '78240');

    final countryInput = find.byKey(BillForm.countryKey);
    await tester.enterText(countryInput, 'United States');

    await tester.pumpAndSettle();
  }

  Future<void> clearIndividualInput({bool timmer = false}) async {
    final streetAddressInput = find.byKey(BillForm.streetAddressKey);
    final cityInput = find.byKey(BillForm.cityKey);
    final postCodeInput = find.byKey(BillForm.postCodeKey);
    final countryInput = find.byKey(BillForm.countryKey);

    final streetAddressClearButton = find.descendant(
        of: streetAddressInput,
        matching: find.byType(
          GestureDetector,
        ));

    expect(streetAddressClearButton, findsOneWidget);

    await tester.tap(streetAddressClearButton);

    final cityInputButton = find.descendant(
        of: cityInput,
        matching: find.byType(
          GestureDetector,
        ));

    expect(cityInputButton, findsOneWidget);

    await tester.tap(cityInputButton);

    final postCodeInputButton = find.descendant(
        of: postCodeInput,
        matching: find.byType(
          GestureDetector,
        ));

    expect(postCodeInputButton, findsOneWidget);

    await tester.tap(postCodeInputButton);

    final countryInputButton = find.descendant(
        of: countryInput,
        matching: find.byType(
          GestureDetector,
        ));

    expect(countryInputButton, findsOneWidget);

    await tester.tap(countryInputButton);
    delay(timmer ? 3 : 0);

    await tester.pumpAndSettle();
  }

  Future<void> tapBackButton() async {
    final backButton = find.byKey(NewInvoice.backButtonKey);
    expect(backButton, findsOneWidget);

    final backButton2 = find.descendant(
        of: backButton, matching: find.byType(GestureDetector).first);
    await tester.tap(backButton2);

    await tester.pumpAndSettle();
  }
}
