import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:invoiceapp/constants/utils/delay.dart';
import 'package:invoiceapp/main.dart' as app;
import '../test/robots/robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('invoice screen load', (tester) async {
    app.main();

    final r = Robot(tester: tester);

    await r.pumpApp();

    r.invoice.findInvoiceScreenBaseLayout();

    await r.invoice.tapNewInvoiceButton();

    r.newInvoice.findBillForm();

    r.newInvoice.findBillFormInputs();

    await r.newInvoice.enterBillFormText();

    await delay(1);

    await r.newInvoice.tapClearText();

    await delay(1);

    await r.newInvoice.enterBillFormText();

    await delay(1);

    await r.newInvoice.clearIndividualInput(timmer: true);

    await r.newInvoice.tapBackButton();

    await delay(2);
  });
}
