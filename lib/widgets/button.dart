import 'package:flutter/cupertino.dart';
import 'package:travelo/misc/colors.dart';

class Button extends StatelessWidget {
  bool? isResponsive;
  double? width;
  Button({Key? key, this.width, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("image/arrow1@0.5x.png"),
        ],
      ),
    );
  }
}
