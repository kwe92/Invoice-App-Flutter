import 'package:flutter/widgets.dart';
import 'package:invoiceapp/constants/enums/status.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class ListTileRightSide extends StatelessWidget {
  final InvoiceFormModel invoice;
  const ListTileRightSide({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    final nameArray =
        invoice.billToText['clientName'].split(' ') as List<String>;
    final fname = nameArray[0];
    final lname = nameArray.length > 1 ? nameArray[1] : ' ';
    final TextStyle nameStyle =
        TextStyle(color: CustomTheme.lightColors['shade0']);
    const double circleSize = 10;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            FittedBox(
              child: Text(
                fname,
                style: nameStyle,
              ),
            ),
            FittedBox(
              child: Text(
                lname,
                style: nameStyle,
              ),
            )
          ],
        ),
        Container(
          height: 46.75,
          width: 108,
          color: const Color.fromARGB(28, 118, 238, 122),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 81, 215, 85),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                Gaps.gapw10,
                FittedBox(
                  child: Text(
                    invoice.status,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 92, 205, 95)),
                  ),
                )
              ]),
        )
      ],
    );
  }
}

// TODO: FInish implementing statusCOlor function

Color? _statusColor(String status) {
  final statusColors = {
    InvoiceStatus.paid.name: const Color.fromARGB(255, 81, 215, 85)
  };
}
