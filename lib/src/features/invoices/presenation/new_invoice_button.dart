import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/theme/theme.dart';

class NewInvoiceButton extends StatelessWidget {
  const NewInvoiceButton({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
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
}