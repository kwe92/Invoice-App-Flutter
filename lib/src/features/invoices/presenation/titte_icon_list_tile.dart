import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class TittleIconListTile extends StatelessWidget {
  const TittleIconListTile({super.key});

  @override
  Widget build(BuildContext context) => _tittleIconListTile();
}

Widget _tittleIconListTile() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ..._filterButton,
              Gaps.gapw12,
              _newInvoiceButton,
            ],
          )
        ],
      ),
    );

final Widget _title = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    const Text(
      'Invoices',
      style: TextStyle(
          fontSize: 24.725, fontWeight: FontWeight.w500, letterSpacing: -1),
    ),
    Text(
      '7 invocies',
      style: TextStyle(color: CustomTheme.lightColors['shade0']),
    )
  ],
);

final List<Widget> _filterButton = [
  const Text(
    'Filter',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  ),
  Gaps.gapw8,
  SizedBox(
    width: 16,
    height: 16,
    child: SvgPicture.asset('assets/icon-arrow-down.svg'),
  ),
];

final _newInvoiceButton = GestureDetector(
  child: Container(
    width: 118,
    height: 58,
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
              width: 38,
              height: 38,
              child: SizedBox(
                width: 38 / 2.25,
                height: 38 / 2.25,
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
                fontSize: 22,
                color: CustomTheme.lightColors['shade3'],
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  ),
);
