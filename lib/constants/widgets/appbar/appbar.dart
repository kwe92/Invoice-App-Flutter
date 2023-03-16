import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/constants/widgets/appbar/app_icon.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  final Radius _radius = const Radius.circular(14);

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: CustomTheme.darkColors['shade3'],
        leading: AppIcon(radius: _radius),
        // actions: _otherIcons(),
        actions: _OtherIcons.otherIcons,
      );
}

class _OtherIcons {
  const _OtherIcons();

  static final otherIcons = [
    Row(
      children: [
        SvgPicture.asset('assets/icon-moon.svg'),
        Gaps.width(21),
        Container(
          height: 56,
          width: 1,
          color: CustomTheme.lightColors['shade0'],
        ),
        Gaps.width(21),
        const SizedBox(
          height: 28,
          width: 28,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/image-avatar.jpg'),
          ),
        ),
        Gaps.width(21)
      ],
    )
  ];
}
