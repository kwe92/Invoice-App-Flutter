import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/custom_text_style.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class IconListTile extends StatelessWidget {
  final InvoiceFormRecord invoice;
  const IconListTile({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) {
    final String clientname = invoice.billToText.clientName.trim();

    final String clientInital = clientname.substring(0, 1);

    final String clientEmail = invoice.billToText.clientEmail.trim();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Invoice for',
          style: CustomTextStyle(),
        ),
        Gaps.gaph12,
        Row(
          children: [
            CircleAvatar(
              backgroundColor: CustomTheme.otherColors.purple0,
              radius: 25.625,
              child: Text(
                clientInital,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Gaps.gapw12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clientname,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.gaph4,
                Text(
                  clientEmail,
                  style: const CustomTextStyle(),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
