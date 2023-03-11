import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

final Color _topColorIconBox = CustomTheme.otherColors['purple0'] as Color;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Radius _radius = const Radius.circular(14);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: CustomTheme.darkColors['shade3'],
            leading: _stack2(radius: _radius),
            actions: _trailing(),
          ),
          body: const SizedBox(),
        ),
      );
}

Widget _stack2({required Radius radius}) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          color: _topColorIconBox,
          borderRadius: BorderRadius.only(
            topRight: radius,
            bottomRight: radius,
          ),
        ),
        height: 60,
      ),
      _stack(radius: radius),
    ],
  );
}

Widget _stack({required Radius radius}) {
  return Stack(
    children: [
      Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: _topColorIconBox,
                borderRadius: BorderRadius.only(
                  topRight: radius,
                ),
              ),
              height: 28,
              width: 60,
            ),
            Container(
              decoration: BoxDecoration(
                color: CustomTheme.otherColors['purple1'] as Color,
                borderRadius: BorderRadius.only(
                  bottomRight: radius,
                  topLeft: radius,
                ),
              ),
              height: 28,
              width: 60,
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/logo.svg',
          colorFilter: ColorFilter.mode(
              CustomTheme.lightColors['shade3'] as Color, BlendMode.srcIn),
        ),
      )
    ],
  );
}

List<Widget> _trailing() {
  const double sqrVal = 28;

  final SizedBox w = Gaps.width(21);
  return [
    Row(
      children: [
        SvgPicture.asset('assets/icon-moon.svg'),
        w,
        Container(
          height: 56,
          width: 1,
          color: CustomTheme.lightColors['shade0'],
        ),
        w,
        const SizedBox(
          height: sqrVal,
          width: sqrVal,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/image-avatar.jpg'),
          ),
        ),
        w
      ],
    )
  ];
}
