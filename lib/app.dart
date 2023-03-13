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
          appBar:
              // TODO: Fix Custom Appbar
              // appBar: const CustomAppBar(),
              AppBar(
            backgroundColor: CustomTheme.darkColors['shade3'],
            leading: _stack2(radius: _radius),
            actions: _trailing(),
          ),
          body: _topIconListTile(),
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

// TODO: Decouple && Make the button smaller

Widget _topIconListTile() {
  const double sqrVal = 46;
  const double factor = 2.25;
  const double dwnArrVal = 16;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Invoices',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          Text('7 invocies')
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Filter',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Gaps.gapw10,
          SizedBox(
            width: dwnArrVal,
            height: dwnArrVal,
            child: SvgPicture.asset('assets/icon-arrow-down.svg'),
          ),
          Gaps.gapw16,
          GestureDetector(
            child: Container(
              width: 132,
              height: 64,
              decoration: BoxDecoration(
                color: CustomTheme.otherColors['purple0'],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        alignment: Alignment.center,
                        width: sqrVal,
                        height: sqrVal,
                        child: SizedBox(
                          width: sqrVal / factor,
                          height: sqrVal / factor,
                          child: SvgPicture.asset(
                            'assets/icon-plus.svg',
                            colorFilter: ColorFilter.mode(
                                CustomTheme.otherColors['purple0'] as Color,
                                BlendMode.srcIn),
                          ),
                        )
                        // const Icon(Icons.add, size: 34),
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'New',
                      style: TextStyle(
                          fontSize: 24,
                          color: CustomTheme.lightColors['shade3'],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    ],
  );
}
