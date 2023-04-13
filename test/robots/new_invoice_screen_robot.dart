import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceapp/constants/utils/delay.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/back_button.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/bill_from.dart';
// import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/new_invoice.dart';

class NewInvoiceScreenRobot {
  final WidgetTester tester;
  const NewInvoiceScreenRobot({required this.tester});

  void findBillFrom() {
    // final BillFrom = find.byKey(NewInvoice.billFromKey);
    expect(BillFrom, findsOneWidget);
  }

  void findBillFromInputs() {
    final streetAddressInput = find.byKey(BillFrom.streetAddressKey);
    expect(streetAddressInput, findsOneWidget);

    final cityInput = find.byKey(BillFrom.cityKey);
    expect(cityInput, findsOneWidget);

    final postCodeInput = find.byKey(BillFrom.postCodeKey);
    expect(postCodeInput, findsOneWidget);

    final countryInput = find.byKey(BillFrom.countryKey);
    expect(countryInput, findsOneWidget);
  }

  Future<void> tapClearText() async {
    final clearInput = find.byKey(BillFrom.clearTextKey);
    expect(clearInput, findsOneWidget);

    await tester.tap(clearInput);
    await tester.pumpAndSettle();
  }

  Future<void> enterBillFromText() async {
    final streetAddressInput = find.byKey(BillFrom.streetAddressKey);
    await tester.enterText(streetAddressInput, '8303 GreatView Dr.');

    final cityInput = find.byKey(BillFrom.cityKey);
    await tester.enterText(cityInput, 'San Antonio');

    final postCodeInput = find.byKey(BillFrom.postCodeKey);
    await tester.enterText(postCodeInput, '78240');

    final countryInput = find.byKey(BillFrom.countryKey);
    await tester.enterText(countryInput, 'United States');

    await tester.pumpAndSettle();
  }

  Future<void> clearIndividualInput({bool timmer = false}) async {
    final streetAddressInput = find.byKey(BillFrom.streetAddressKey);
    final cityInput = find.byKey(BillFrom.cityKey);
    final postCodeInput = find.byKey(BillFrom.postCodeKey);
    final countryInput = find.byKey(BillFrom.countryKey);

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
    // final backButton = find.byKey(NewInvoice.backButtonKey);
    // expect(backButton, findsOneWidget);

    final backbuttonContainer = find.byType(Column).first;
    expect(backbuttonContainer, findsOneWidget);

    // final backButton2 = find.descendant(
    //     of: backButton, matching: find.byType(GestureDetector).first);

    final button = find.byType(CustomBackButton);

    await tester.ensureVisible(find.byType(CustomBackButton));

    // final backButton2 = find.descendant(
    //     of: backbuttonContainer, matching: find.byType(CustomBackButton));

    await tester.tap(button);

    await tester.pumpAndSettle();
  }
}
