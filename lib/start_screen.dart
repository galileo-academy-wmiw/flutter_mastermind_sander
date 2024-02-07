import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/game_screen.dart';
import 'package:flutter_mastermind_sander/main.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_mastermind_sander/variables.dart';
import 'row_of_pins.dart';

class MastermindLogo extends StatelessWidget {
  const MastermindLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('images/mastermind_logo.png');
  }
}


class StartScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MastermindLogo(),
          ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_forward),
                  Text(
                    "Play Mastermind!",
                    style: buttonTextStyle,
                  ),
                ],
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GameScreenRoute()),
              );
              if (isSoundOn) {
                audioPlayer.play(AssetSource(startUpSound));
              }
              secretCode = createNewCodeSnippet();
              allRows = [
                RowOfPins(),
              ];
            },
          ),
        ],
      )
    );
  }
}