import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_from_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';
import 'package:provider/provider.dart';

class NewInvoiceButton extends StatelessWidget {
  const NewInvoiceButton({super.key});

  @override
  Widget build(BuildContext context) =>
      Consumer3(builder: (context, BillFromModel billFromModel, BillToModel billToModel, ItemListModel itemsModel, child) {
        return GestureDetector(
          onTap: () {
            // ?? why was this put here??
            // throw Exception();
            context.push('/newInvoice');
            billFromModel.clearAllControllers();
            billToModel.clearAllControllers();
            itemsModel.clearItemsState();
          },
          child: Container(
            width: 118,
            height: 58,
            decoration: BoxDecoration(
              color: CustomTheme.otherColors.purple0,
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
                        // colorFilter: ColorFilter.mode(
                        //     CustomTheme.otherColors['purple0'] as Color,
                        //     BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
                Gaps.gapw8,
                Expanded(
                  child: Text(
                    'New',
                    style: TextStyle(
                      fontSize: 22,
                      color: CustomTheme.lightColors.shade3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
