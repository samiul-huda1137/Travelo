import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  int size;
  final String text;
  final Color color;
  LargeText({Key? key,
    required this.size,
    required this.text,
    required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text
    );
  }
}
