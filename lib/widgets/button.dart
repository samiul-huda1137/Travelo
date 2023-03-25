import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelo/misc/colors.dart';
import 'package:travelo/widgets/app_text.dart';

class Button extends StatelessWidget {
  bool? isResponsive;
  double? width;
  Button({Key? key, this.width=120, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceAround:MainAxisAlignment.center,
          children: [
            isResponsive==true?AppText(text: "Book Trip Now", color: Colors.white):Container(),
            Image.asset("image/arrow1@0.5x.png"),
          ],
        ),
      ),
    );
  }
}
