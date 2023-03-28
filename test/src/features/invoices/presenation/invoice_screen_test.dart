import 'package:flutter_test/flutter_test.dart';
import '../../../../robots/robot.dart';

void main() {
  group('Widget Test', () {
    testWidgets('''
      Given: app loads
      When: tap on new invoice button
      Then: navigate to the new invoice screen
      ''', (WidgetTester tester) async {
      final r = Robot(tester: tester);

      await r.pumpApp();

      r.invoice.findInvoiceScreenBaseLayout();

      await r.invoice.tapNewInvoiceButton();

      r.newInvoice.findBillFrom();
    });

    testWidgets('''
      Given: new invoice screen loads 
      When: input is entered && clear buttons pressed && back button pressed
      Then: text is entered && text is cleared && back button is pressed
      ''', (WidgetTester tester) async {
      final r = Robot(tester: tester);

      await r.pumpApp();

      await r.invoice.tapNewInvoiceButton();

      await r.newInvoice.enterBillFromText();

      await r.newInvoice.tapClearText();

      await r.newInvoice.enterBillFromText();

      await r.newInvoice.clearIndividualInput();

      await r.newInvoice.tapBackButton();
    });
  });
}
