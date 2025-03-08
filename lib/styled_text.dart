import 'package:flutter/material.dart';
class StyledText extends StatelessWidget {
  const StyledText(this.text,this.color, {super.key});

  final String text;
  final Color color;
  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: 28, fontWeight: FontWeight.w100),
    );
  }
}
