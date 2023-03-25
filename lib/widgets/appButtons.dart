import 'package:flutter/cupertino.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundcolor;
  double size;
  final Color bordercolor;

  AppButtons({Key? key,
    required this.size,
    required this.color,
    required this.backgroundcolor,
    required this.bordercolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: bordercolor,
          width: 1.0
        ),
          borderRadius: BorderRadius.circular(15),
          color: backgroundcolor
      ),
    );
  }
}
