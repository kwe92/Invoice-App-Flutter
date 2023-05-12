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
      decoration: BoxDecoration(
        color: status == 'paid' ? const Color.fromARGB(28, 118, 238, 122) : const Color.fromRGBO(255, 143, 0, 0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: status == 'paid' ? const Color.fromARGB(255, 81, 215, 85) : const Color.fromRGBO(255, 143, 0, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        Gaps.gapw10,
        FittedBox(
          child: Text(
            status,
            style: TextStyle(
              color: status == 'paid' ? const Color.fromARGB(255, 92, 205, 95) : const Color.fromRGBO(255, 143, 0, 1),
            ),
          ),
        ),
      ]),
    );
  }
}
