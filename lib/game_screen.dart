import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/score_screen.dart';
import 'scorepin.dart';
import 'package:audioplayers/audioplayers.dart';
import 'theme.dart';
import 'variables.dart';
import 'codepin.dart';


// Constructor for the widget of a row of pins that will make up the stages of the game
class RowOfPins extends StatefulWidget {
  const RowOfPins({super.key});

  @override
  State<RowOfPins> createState() => _RowOfPinsState();
}

class _RowOfPinsState extends State<RowOfPins> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(seconds: 2),
      left: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Codepin(0),
          Codepin(1),
          Codepin(2),
          Codepin(3),
          Expanded(
              child: Center(
                child: IconButton(
                  onPressed: (){
                    audioPlayer.play(AssetSource(startUpSound));
                    print(codePinColorSequence);
                  },
                  iconSize: 40,
                  color: textColor,
                  icon: const Icon(
                    Icons.play_arrow
                  ),
                ),
              ),
          ),
          const Expanded(
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


// This builds the game
class GameScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        height: 2200,
        color: backgroundColor,
        child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Container(
                    height: 100,
                      child: const RowOfPins()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Container(
                      height: 100,
                      child: const RowOfPins()
                  ),
                ),
              ),
              const ScoreScreenButton(),
            ]
        )
    );
  }
}