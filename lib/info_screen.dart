import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/start_screen.dart';
import 'package:flutter_mastermind_sander/theme.dart';

class InfoScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: pTextStyle,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
                child: MastermindLogo(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(18.0),
            child: Text(
                'Welcome to Mastermind! The Mastermind has conceived of a brilliant code. Can you guess it? The goal of Mastermind is to guess the correct sequence of four colors in as few turns as possible. Click on the large pins to choose a color. Press enter to confirm your choice.'
            ),
          ),
          Container(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'The four small pins on the right will give you feedback. A green pin means you guessed one of the pins correctly - both the color and position. A yellow pin means the color is present in the code, but the position is incorrect. A red pin means the color does not feature in the code at all!',
            ),
          ),
        ],
      ),
    );
  }
}