import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoiceapp/app.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/bill_from_model.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('app ...', (WidgetTester tester) async {
    await tester.pumpWidget(Provider<BillFromModel>(
      create: (context) => BillFromModel(),
      child: const MaterialApp(home: MyApp()),
    ));
  });
}
