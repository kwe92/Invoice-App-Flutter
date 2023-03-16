import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 34.25, bottom: 32),
            child: SizedBox(
                child: SvgPicture.asset('assets/illustration-empty.svg')),
          ),
          const Text(
            'There is nothing here',
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w500, letterSpacing: -0.5),
          ),
          Gaps.gaph16,
          SizedBox(
              width: 206,
              child: Text(
                'Click the new button to get started creating an invoice',
                style: TextStyle(
                    fontSize: 16, color: CustomTheme.lightColors['shade0']),
              )),
        ],
      );
}
