import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:invoiceapp/constants/utils/delay.dart';
import 'package:invoiceapp/src/features/invoices/presenation/invoice_screen.dart';
import 'package:invoiceapp/src/features/invoices/presenation/title_icon_list_tile.dart';

import 'package:invoiceapp/main.dart' as app;
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_from.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/new_invoice.dart';
import 'package:provider/provider.dart';

import '../test/robots/invoice_screen_robot.dart';
import '../test/robots/new_invoice_screen_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('invoice screen load', (tester) async {
    app.main();

    final r1 = InvoiceScreenRobot(tester: tester);
    final r2 = NewInvoiceScreenRobot(tester: tester);

    await r1.navigateToInvoiceScreen();

    r1.findInvoiceScreenBaseLayout();

    await delay(5);

    await r1.tapNewInvoiceButton();

    r2.findBillForm();

    r2.findBillFormInputs();

    await r2.enterBillFormText();

    await delay(1);

    await r2.tapClearText();

    await delay(1);

    await r2.enterBillFormText();

    await delay(1);

    await r2.clearIndividualInput(timmer: true);
  });
}
