import 'package:flutter/material.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class StatusIndicator extends StatelessWidget {
  final double size;
  final String status;

  const StatusIndicator({required this.size, required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.75,
      width: 108,
      color: const Color.fromARGB(28, 118, 238, 122),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          width: size,
          height: size,
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
            status,
            style: const TextStyle(color: Color.fromARGB(255, 92, 205, 95)),
          ),
        )
      ]),
    );
  }
}
