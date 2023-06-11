import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/enums/hash_keys.dart';
import 'package:invoiceapp/src/features/view_invoice/presentation/description_section/custom_text_style.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class ItemsListTile extends StatelessWidget {
  // TODO: item should be a record
  final Map<String, dynamic> item;
  const ItemsListTile({required this.item, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item[HashKeys.itemName.name],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.gaph6,
                Text(
                  'QTY ${item[HashKeys.quantity.name]} x \$${item[HashKeys.price.name]}',
                  style: const CustomTextStyle(),
                )
              ],
            ),
            Text(
              '\$${item[HashKeys.total.name]}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      );
}
