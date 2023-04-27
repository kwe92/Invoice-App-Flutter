import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onPressed;
  final ButtonStyle style;
  const ModalButton(
      {required this.text,
      required this.onPressed,
      required this.style,
      super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 175,
        child: ElevatedButton(style: style, onPressed: onPressed, child: text),
      );
}
