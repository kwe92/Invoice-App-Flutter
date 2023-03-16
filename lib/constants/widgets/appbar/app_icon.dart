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
        _Icon(radius: radius, color: topColorIconBox),
      ],
    );
  }
}

class _Icon extends StatelessWidget {
  final Radius radius;
  final Color color;

  const _Icon({required this.radius, required this.color, super.key});

  @override
  Widget build(BuildContext context) => Stack(children: [
        Center(
            child: Column(children: [
          _TopBox(color: color, radius: radius),
          _BottomBox(radius: radius),
        ])),
        _iconImage
      ]);
}

class _TopBox extends StatelessWidget {
  final Color color;
  final Radius radius;

  const _TopBox({required this.color, required Radius this.radius, super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topRight: radius,
          ),
        ),
        height: 28,
        width: 60,
      );
}

class _BottomBox extends StatelessWidget {
  final Radius radius;

  const _BottomBox({required this.radius, super.key});

  @override
  Widget build(BuildContext context) => Container(
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
}

final _iconImage = Container(
  alignment: Alignment.center,
  child: SvgPicture.asset(
    'assets/logo.svg',
    colorFilter: ColorFilter.mode(
        CustomTheme.lightColors['shade3'] as Color, BlendMode.srcIn),
  ),
);
