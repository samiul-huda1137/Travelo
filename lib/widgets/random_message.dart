import 'package:flutter/material.dart';
import 'dart:math';

List<String> messages = [
  'Hello!',
  'How are you?',
  'What\'s up?',
  'Nice to meet you',
  'Have a great day!'
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
      children: [
        // Display the current message in a Text widget
        Text(currentMessage),

        // Add a button to trigger the selection of a random message
        ElevatedButton(
          onPressed: _selectRandomMessage,
          child: Text('Show Random Message'),
        ),
      ],
    );
  }
}
