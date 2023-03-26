import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushReplacementNamed('/'),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icon-arrow-left.svg',
          ),
          Gaps.gapw8,
          const Text(
            'Go Back',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
