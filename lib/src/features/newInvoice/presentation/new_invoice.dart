import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/constants/widgets/appbar/appbar.dart';
import 'package:invoiceapp/constants/widgets/base_scaffold/base_scaffold.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/bill_from.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class NewInvoice extends StatelessWidget {
  const NewInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: Padding(
      padding: CustomTheme.mainContentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _backButton(context),
          Gaps.gaph18,
          _txt,
          const BillForm()
        ],
      ),
    ));
  }
}

const _txt = Text(
  'New Invoice',
  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
);

Widget _backButton(BuildContext context) => GestureDetector(
      onTap: () => context.pushReplacement('/'),
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
