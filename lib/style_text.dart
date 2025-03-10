import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.text, this.size, {super.key});

  final String text;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(color: Colors.white, fontSize: size!),
      textAlign: TextAlign.center,
    );
  }
}
