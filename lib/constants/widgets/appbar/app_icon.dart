import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/constants/widgets/appbar/app_icon.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class AppIcon extends StatelessWidget {
  final Radius radius;
  const AppIcon({required this.radius, super.key});

  @override
  Widget build(BuildContext context) {
    final Color topColorIconBox = CustomTheme.otherColors['purple0'] as Color;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: topColorIconBox,
            borderRadius: BorderRadius.only(
              topRight: radius,
              bottomRight: radius,
            ),
          ),
          height: 60,
        ),
        _icon(radius: radius, color: topColorIconBox),
      ],
    );
  }
}

Widget _icon({required Radius radius, required Color color}) {
  return Stack(children: [
    Center(
        child: Column(children: [
      _topBox(color: color, radius: radius),
      _bottomBox(radius: radius),
    ])),
    _iconImage()
  ]);
}

Container _topBox({required Color color, required Radius radius}) => Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topRight: radius,
        ),
      ),
      height: 28,
      width: 60,
    );

Container _bottomBox({required Radius radius}) => Container(
      decoration: BoxDecoration(
        color: CustomTheme.otherColors['purple1'] as Color,
        borderRadius: BorderRadius.only(
          bottomRight: radius,
          topLeft: radius,
        ),
      ),
      height: 28,
      width: 60,
    );

Container _iconImage() => Container(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/logo.svg',
        colorFilter: ColorFilter.mode(
            CustomTheme.lightColors['shade3'] as Color, BlendMode.srcIn),
      ),
    );
