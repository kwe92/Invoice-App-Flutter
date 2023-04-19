import 'package:flutter/material.dart';

class TotalSection extends StatelessWidget {
  final double total;
  const TotalSection({required this.total, super.key});

  @override
  Widget build(BuildContext context) => Container(
        // TODO: Add Navy Blue to CustomTheme.otherColors

        height: 46,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(18, 103, 177, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Total',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                '\$${total.toString()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
}
