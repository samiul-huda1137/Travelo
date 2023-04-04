import 'package:flutter/material.dart';
import 'package:travelo/misc/colors.dart';
import 'package:travelo/widgets/app_text.dart';
import 'dart:math';

import 'package:travelo/widgets/large_text.dart';

List<String> messages = [
  '\"Adventure is worthwhile.\" \n~ Aesop',
  '\"To travel is to live.\" \n~ Hans Christian Andersen',
  '\"Traveling – it leaves you speechless, then turns you into a storyteller.\" \n~ Ibn Battuta',
  '\"A journey is best measured in friends, rather than miles.\" \n~ Tim Cahill',
  '\"The world is a book and those who do not travel read only one page.\" \n~ Saint Augustine'
];

class RandomMessage extends StatefulWidget {
  const RandomMessage({Key? key}) : super(key: key);

  @override
  State<RandomMessage> createState() => _RandomMessageState();
}

class _RandomMessageState extends State<RandomMessage> {
  // Define a variable to hold the current message
  String currentMessage = '';

  // Define a function to select a random message
  void _selectRandomMessage() {
    // Generate a random number between 0 and the length of the messages list
    int randomIndex = Random().nextInt(messages.length);

    // Get the message at the random index
    String randomMessage = messages[randomIndex];

    // Update the current message variable
    setState(() {
      currentMessage = randomMessage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Display the current message in a Text widget
        AppText(text: currentMessage, fontStyle: FontStyle.italic, size: 22,),

        // Add a button to trigger the selection of a random message
        ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Set the button color to transparent
          shadowColor: Colors.transparent, // Remove the button's shadow
            elevation: 0, // Remove the button's elevation
    ),
          onPressed: _selectRandomMessage,
          child: Icon(Icons.touch_app, color: AppColors.mainColor, size: 46,),
        ),
      ],
    );
  }
}
