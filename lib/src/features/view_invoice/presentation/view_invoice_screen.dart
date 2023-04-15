import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/back_button.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class ViewInvoiceScreen extends StatelessWidget {
  const ViewInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) => BaseScaffold(
        body: Padding(
          padding: CustomTheme.mainContentPadding,
          child: Column(
            children: const <Widget>[
              CustomBackButton(),
              Gaps.gaph12,
              _ListTile()
            ],
          ),
        ),
      );
}

class _ListTile extends StatelessWidget {
  const _ListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bill From User',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
        ),
        Gaps.gaph6,
        Row(
          children: [
            const Text('Invoice #'),
            OutlinedButton(onPressed: () {}, child: const Text('Pending'))
          ],
        )
      ],
    );
  }
}
