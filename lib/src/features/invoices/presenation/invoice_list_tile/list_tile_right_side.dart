import 'package:flutter/widgets.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class ListTileRightSide extends StatelessWidget {
  const ListTileRightSide({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle nameStyle =
        TextStyle(color: CustomTheme.lightColors['shade0']);
    const double circleSize = 10;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Baki',
              style: nameStyle,
            ),
            Text(
              'Hanma',
              style: nameStyle,
            )
          ],
        ),
        Container(
          height: 46.75,
          width: 108,
          color: const Color.fromARGB(28, 118, 238, 122),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 81, 215, 85),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                Gaps.gapw10,
                const Expanded(
                  child: Text(
                    'Pending',
                    style: TextStyle(color: Color.fromARGB(255, 92, 205, 95)),
                  ),
                )
              ]),
        )
      ],
    );
  }
}
