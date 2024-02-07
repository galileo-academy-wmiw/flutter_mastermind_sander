import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/score_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'variables.dart';
import 'row_of_pins.dart';
import 'dart:math';



List<RowOfPins> allRows = [
  RowOfPins(),
  ];

void makeNewRowOfPins() {
  allRows.add(RowOfPins());
}

// Function that creates and returns a list of 4 unique integers between 1 and 6
List<int> createNewCodeSnippet() {
  List<int> newCodeSnippet = [];
  while (newCodeSnippet.length < 4) {
    int nextValue = Random().nextInt(6) + 1;
    if (newCodeSnippet.contains(nextValue) == false) {
      newCodeSnippet.add(nextValue);
    }

  }
  print(newCodeSnippet);
  return newCodeSnippet;
}

// Function that checks a list against the list stored in secretCode and returns a list with feedback
List<int> checkCodes(inputCode) {
  List<int> controlFeedback = [];
  for (int i = 0; i < 4; i++) {
    if (inputCode[i] == secretCode[i]) {
      controlFeedback.add(2);
    } else if (secretCode.contains(inputCode[i])) {
      controlFeedback.add(1);
    } else {
      controlFeedback.add(0);
    }
  }
  controlFeedback.sort();
  return controlFeedback;
}

// This builds the game
class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        height: 2200,
        color: backgroundColor,
        child: ListView(
            children: allRows
        )
    );
  }

  @override
  bool get wantKeepAlive => true;
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
          if (isSoundOn) {
            audioPlayer.play(AssetSource('audio/up-chime-2.mp3'));
          }
        },
      ),
    );
  }
}