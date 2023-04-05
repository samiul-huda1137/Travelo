import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontStyle? fontStyle;
  final String fontFamily;

  LargeText({Key? key,
    this.size=30,
    required this.text,
    this.color=Colors.black, this.fontStyle, this.fontFamily= 'Righteous'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        fontFamily,
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontStyle: fontStyle,
        ),
      ),
    );
  }
}
