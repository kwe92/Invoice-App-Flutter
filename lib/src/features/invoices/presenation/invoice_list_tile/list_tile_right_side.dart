import 'package:flutter/widgets.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/status_indicator.dart';
import 'package:invoiceapp/theme/theme.dart';

class ListTileRightSide extends StatelessWidget {
  final InvoiceFormModel invoice;
  const ListTileRightSide({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Should be removed as input should never be nul;

    final nameArray = invoice.billToText['clientName'] != null ? invoice.billToText['clientName'].split(' ') as List<String> : [' '];
    final fname = nameArray[0];
    final lname = nameArray.length > 1 ? nameArray[1] : ' ';
    final TextStyle nameStyle = TextStyle(color: CustomTheme.lightColors['shade0']);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // TODO: Take care of when user enters long text
            Text(
              fname,
              style: nameStyle,
            ),
            Text(
              lname,
              style: nameStyle,
            )
          ],
        ),
        StatusIndicator(size: 10, status: invoice.status),
      ],
    );
  }
}

// TODO: FInish implementing statusCOlor function

