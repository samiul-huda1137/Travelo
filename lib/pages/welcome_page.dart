import 'package:flutter/material.dart';
import 'package:travelo/misc/colors.dart';
import 'package:travelo/widgets/app_text.dart';
import 'package:travelo/widgets/large_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images  = [
    "7.jpg",
    "1.jpg",
    "4.jpg"
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
                      )
                    ],
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}
