import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontStyle? fontStyle;

  AppText({Key? key,
    this.size=16,
    required this.text,
    this.color=Colors.black54, this.fontStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontStyle: fontStyle,
      ),
    );
  }
}