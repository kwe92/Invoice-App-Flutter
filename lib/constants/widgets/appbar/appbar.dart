import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/constants/widgets/appbar/app_icon.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  final Radius _radius = const Radius.circular(14);

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomTheme.darkColors['shade3'],
      leading: AppIcon(radius: _radius),
      actions: _otherIcons(),
    );
  }
}

List<Widget> _otherIcons() {
  const double sqrVal = 28;

  final SizedBox gapw = Gaps.width(21);
  return [
    Row(
      children: [
        SvgPicture.asset('assets/icon-moon.svg'),
        gapw,
        Container(
          height: 56,
          width: 1,
          color: CustomTheme.lightColors['shade0'],
        ),
        gapw,
        const SizedBox(
          height: sqrVal,
          width: sqrVal,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/image-avatar.jpg'),
          ),
        ),
        gapw
      ],
    )
  ];
}
