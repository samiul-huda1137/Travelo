import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontStyle? fontStyle;
  final String fontFamily;

  AppText({Key? key,
    this.size=16,
    required this.text,
    this.color=Colors.black54, this.fontStyle, this.fontFamily= 'Roboto'}) : super(key: key);

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