import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/models/load_form_models.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class EditButton extends StatelessWidget {
  final InvoiceFormModel invoice;
  const EditButton({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Consumer3(
        builder: (context, BillFromModel billFromModel, BillToModel billToModel,
                ItemListModel itemsModel, child) =>
            IconButton(
          color: CustomTheme.otherColors['blue0'],
          icon: const Icon(Icons.edit),
          onPressed: () {
            LoadFormControllers.load(context, billFromModel, billToModel,
                itemsModel, invoice, false);
          },
        ),
      );
}
