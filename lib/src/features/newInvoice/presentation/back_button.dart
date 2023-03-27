import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const _BackButton(),
      );
}

class _BackButton extends StatelessWidget {
  const _BackButton({super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          _BackButtonImage(),
          Gaps.gapw8,
          _BackButtonText()
        ],
      );
}

class _BackButtonImage extends StatelessWidget {
  const _BackButtonImage({super.key});

  @override
  Widget build(BuildContext context) {
    const double imageSize = 16;
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: SvgPicture.asset(
        'assets/icon-arrow-left.svg',
      ),
    );
  }
}

class _BackButtonText extends StatelessWidget {
  const _BackButtonText({super.key});
  @override
  Widget build(BuildContext context) => const Text(
        'Go Back',
        style: TextStyle(fontSize: 18),
      );
}
