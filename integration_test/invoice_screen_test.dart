// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:invoiceapp/constants/utils/delay.dart';
// import 'package:invoiceapp/main.dart' as app;
// import 'package:invoiceapp/src/features/shared/services/get_it.dart';
// import '../test/robots/robot.dart';

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() => configureDependencies());
//   testWidgets('''
//     Given: app loads
//     When: tap on new invoice button && new invoice screen loads
//     Then: enter form text && clear form text && press back button
//   ''', (tester) async {
//     app.main();

//     final Robot r = Robot(tester: tester);

//     await r.pumpApp();

//     r.invoice.findInvoiceScreenBaseLayout();

//     await r.invoice.tapNewInvoiceButton();

//     r.newInvoice.findBillFrom();

//     r.newInvoice.findBillFromInputs();

//     await r.newInvoice.enterBillFromText();

//     await delay(1);

//     await r.newInvoice.tapClearText();

//     await delay(1);

//     await r.newInvoice.enterBillFromText();

//     await delay(1);

//     await r.newInvoice.clearIndividualInput(timmer: true);

//     await r.newInvoice.tapBackButton();
//   });
// }
