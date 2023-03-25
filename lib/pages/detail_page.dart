import 'package:flutter/material.dart';
import 'package:travelo/misc/colors.dart';
import 'package:travelo/widgets/appButtons.dart';
import 'package:travelo/widgets/app_text.dart';
import 'package:travelo/widgets/large_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gotStars =4;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("image/mountain.jpg"),
                      fit: BoxFit.fill
                    ),
                  ),
              )
            ),
            Positioned(
                left: 20,
                right: 20,
                top: 50,
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.menu),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_control))
                    ],
                  ),
                )
            ),
            Positioned(
              top: 320,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LargeText(text: "Yosemite", color: Colors.black.withOpacity(0.8),),
                          LargeText(text: "\& 250", color: AppColors.mainColor,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.mainColor,),
                          SizedBox(width: 5,),
                          AppText(text: "USA, California",color: AppColors.textColor1,)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index){
                                return Icon(Icons.star, color: index<gotStars?AppColors.starColor:AppColors.textColor2);
                          }),
                          ),
                          SizedBox(width: 10,),
                          AppText(text: "(4.0)", color: AppColors.textColor2,)
                        ],
                      ),
                      SizedBox(height: 25,),
                      LargeText(text: "People", color: Colors.black.withOpacity(0.8),size: 20,),
                      SizedBox(height: 5,),
                      AppText(text: "Number of people in your group", color: AppColors.mainTextColor,),
                      SizedBox(height: 10,),
                      Wrap(
                        children: List.generate(5, (index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex=index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(size: 50,
                                  color: selectedIndex==index?Colors.white:Colors.black,
                                  backgroundcolor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                  bordercolor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                  text: (index+1).toString(),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
            )
            )
          ],
        ),
      )
    );
  }
}
