import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';

class FilterButton {
  static final List<Widget> filterButton = [
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
  const FilterButton();
}
