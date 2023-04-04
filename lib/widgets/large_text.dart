import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontStyle? fontStyle;
  LargeText({Key? key,
    this.size=30,
    required this.text,
    this.color=Colors.black, this.fontStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontStyle: fontStyle,
      ),
    );
  }
}
