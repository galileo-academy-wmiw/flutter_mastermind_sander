import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/score_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'theme.dart';
import 'variables.dart';
import 'row_of_pins.dart';



List<RowOfPins> allRows = [
  RowOfPins(active: true),
  RowOfPins(active: false),
  RowOfPins(active: false),
  ];

// Constructor of button to take player to ScoreScreen
class ScoreScreenButton extends StatelessWidget {
  const ScoreScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.scoreboard),
                Text("Check your score!", style: buttonTextStyle),
              ],
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScoreScreen())
            );
            audioPlayer.play(AssetSource('audio/up-chime-2.mp3'));
          },
        ),
    );
  }
}


// This builds the game
class GameScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        height: 2200,
        color: backgroundColor,
        child: ListView(
            children: allRows
        )
    );
  }
}