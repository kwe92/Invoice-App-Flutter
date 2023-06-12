import 'package:flutter/material.dart';
import 'package:invoiceapp/theme/theme.dart';

class ModalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ModalButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 175,
          height: 62,
          decoration: BoxDecoration(
            color: CustomTheme.otherColors.purple0,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
        ),
      );
}
