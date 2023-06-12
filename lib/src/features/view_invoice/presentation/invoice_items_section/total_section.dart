import 'package:flutter/material.dart';
import 'package:invoiceapp/theme/theme.dart';

class TotalSection extends StatelessWidget {
  final double total;

  const TotalSection({required this.total, super.key});

  @override
  Widget build(BuildContext context) {
    const double radiusSize = 12;
    const double padding = 12;
    const double fontSize = 18;
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: CustomTheme.otherColors.purple0,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(radiusSize),
          bottomRight: Radius.circular(radiusSize),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: padding, right: padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Total',
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
