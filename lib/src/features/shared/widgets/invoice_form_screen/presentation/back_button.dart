import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomBackButton extends StatelessWidget {
  final bool showText;
  const CustomBackButton({this.showText = true, super.key});

  @override
  Widget build(BuildContext context) => Consumer3(
        builder: (context, BillFromModel billFromModel, BillToModel billToModel,
                ItemListModel itemsModel, child) =>
            GestureDetector(
          onTap: () {
            billFromModel.clearAllControllers();
            billToModel.clearAllControllers();
            itemsModel.clearItemsState();
            Navigator.pop(context);
          },
          child: _BackButton(
            showText: showText,
          ),
        ),
      );
}

class _BackButton extends StatelessWidget {
  final bool showText;

  const _BackButton({required this.showText, super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _BackButtonImage(
            showText: showText,
          ),
          showText == true ? Gaps.gapw8 : const SizedBox(),
          showText == true ? const _BackButtonText() : const SizedBox()
        ],
      );
}

class _BackButtonImage extends StatelessWidget {
  final bool showText;

  const _BackButtonImage({required this.showText, super.key});

  @override
  Widget build(BuildContext context) {
    const double imageSize = 16;
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: SvgPicture.asset(
        'assets/icon-arrow-left.svg',
        color: showText == true ? null : CustomTheme.otherColors['blue0'],
      ),
    );
  }
}

class _BackButtonText extends StatelessWidget {
  const _BackButtonText({super.key});
  @override
  Widget build(BuildContext context) => const Text(
        'Go Home',
        style: TextStyle(fontSize: 18),
      );
}
