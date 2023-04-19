import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/custom_text_style.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class IconListTile extends StatelessWidget {
  final InvoiceFormModel invoice;
  const IconListTile({required this.invoice, super.key});

  @override
  Widget build(BuildContext context) => Column(
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
                backgroundColor: CustomTheme.otherColors['blue0'],
                radius: 25.625,
                child: Text(
                  invoice.billToText['clientName']
                      .toString()
                      .trim()
                      .substring(0, 1),
                ),
              ),
              Gaps.gapw12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    invoice.billToText['clientName'].toString().trim(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Gaps.gaph4,
                  Text(
                    invoice.billToText['clientEmail'].toString().trim(),
                    style: const CustomTextStyle(),
                  )
                ],
              )
            ],
          )
        ],
      );
}
