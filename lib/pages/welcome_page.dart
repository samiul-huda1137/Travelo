import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelo/cubit/app_cubits.dart';
import 'package:travelo/misc/colors.dart';
import 'package:travelo/widgets/app_text.dart';
import 'package:travelo/widgets/button.dart';
import 'package:travelo/widgets/large_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images  = [
    "7.png",
    "1.png",
    "4.png"
  ];
  List largetext = [
    "Mountains",
    "Beaches",
    "City Sightseeing"
  ];
  List text = [
    "Mountain hikes give you an incredible sense of freedom along with endurance tests",
    "Going to a sea beach offers an opportunity to relax, unwind, and enjoy the sun, sand, and surf",
    "City sightseeing tour offers a chance to explore and experience new culture, history, and architecture"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("image/"+images[index]),
              fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(text: "Trips"),
                      AppText(text: largetext[index], size: 30),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: AppText(text: text[index],
                        color: AppColors.textColor2, size: 14,
                        ),
                      ),
                      SizedBox(height: 40,),
                      GestureDetector(
                        onTap: (){
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(
                          width: 200,
                            child: Row(
                              children: [
                                Button(width: 120),
                              ],
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index==indexDots?25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}
