import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.text, this.size, {super.key});

  final String text;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: size!),
    );
  }
}
