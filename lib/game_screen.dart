import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/score_screen.dart';
import 'codepin.dart';
import 'scorepin.dart';
import 'package:audioplayers/audioplayers.dart';
import 'theme.dart';

// Constructor for the rows of pin that will make up the stages of the game
class RowOfPins extends StatelessWidget {
  const RowOfPins({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: Codepin()),
          Expanded(child: Codepin()),
          Expanded(child: Codepin()),
          Expanded(child: Codepin()),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Scorepin(),
                    Scorepin(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Scorepin(),
                    Scorepin(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
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
// Initialize instance of AudioPlayer
final AudioPlayer audioPlayer = AudioPlayer();

// This builds the game
class GameScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        height: 2200,
        color: backgroundColor,
        child: ListView(
            children: const [
              RowOfPins(),
              ScoreScreenButton(),
            ]
        )
    );
  }
}