import 'package:flutter_test/flutter_test.dart';
import '../../../../robots/invoice_screen_robot.dart';
import '../../../../robots/new_invoice_screen_robot.dart';

void main() {
  testWidgets('invoice screen load', (tester) async {
    final r1 = InvoiceScreenRobot(tester: tester);
    final r2 = NewInvoiceScreenRobot(tester: tester);

    await r1.navigateToInvoiceScreen();

    r1.findInvoiceScreenBaseLayout();

    await r1.tapNewInvoiceButton();

    r2.findBillForm();

    r2.findBillFormInputs();

    await r2.enterBillFormText();

    await r2.tapClearText();

    await r2.enterBillFormText();

    await r2.clearIndividualInput();
  });
}
