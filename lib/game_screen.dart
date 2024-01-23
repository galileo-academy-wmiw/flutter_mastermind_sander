import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/score_screen.dart';
import 'codepin.dart';
import 'scorepin.dart';

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
                Text("Check your score!"),
              ],
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScoreScreen())
            );
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
        color: Colors.white,
        child: ListView(
            children: const [
              RowOfPins(),
              ScoreScreenButton(),
            ]
        )
    );
  }
}