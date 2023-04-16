import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoiceapp/constants/widgets/appbar/app_icon.dart';
import 'package:invoiceapp/src/features/authentication/presentation/profile_screen.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final Radius _radius = const Radius.circular(14);

  @override
  final Size preferredSize;

  const CustomAppBar({required this.preferredSize, super.key});

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: CustomTheme.appBarSize,
        child: AppBar(
            backgroundColor: CustomTheme.darkColors['shade3'],
            leading: AppIcon(radius: _radius),
            actions: [
              Row(
                children: [
                  SvgPicture.asset('assets/icon-moon.svg'),
                  Gaps.width(21),
                  Container(
                    height: 56,
                    width: 1,
                    color: CustomTheme.lightColors['shade0'],
                  ),
                  Gaps.width(21),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const CustomProfileScreen(),
                          ));
                    },
                    child: const SizedBox(
                      height: 28,
                      width: 28,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image-avatar.jpg'),
                      ),
                    ),
                  ),
                  Gaps.width(21)
                ],
              )
            ]),
      );

  @override
  // TODO: Is this correct code?
  Widget get child => const SizedBox();
}
