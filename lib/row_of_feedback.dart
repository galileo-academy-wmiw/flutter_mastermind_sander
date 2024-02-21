import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/game_screen.dart';
import 'score_screen.dart';
import 'variables.dart';

// Widget for the Feedback row
class FeedbackRow extends StatefulWidget {
  const FeedbackRow({super.key});

  @override
  State<FeedbackRow> createState() => _FeedbackRowState();
}

class _FeedbackRowState extends State<FeedbackRow> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          color: textColor,
          shape: StadiumBorder(
            side: BorderSide(
              color: textColor,
              width: 2.5
            )
          ),
          child: Container(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<Object>(
                        stream: GameScreen.notifier.stream,
                        builder: (context, snapshot) {
                          return Text('Tries left: ${numOfTries - (allRows.length - 1)}',
                          style: appBarTextStyle,);
                        }
                      ),
                      ScoreScreenButton()
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text(feedbackList[i],
                              style: appBarTextStyle,
                              textAlign: TextAlign.center,
                            )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Constructor of button to take player to ScoreScreen
class ScoreScreenButton extends StatelessWidget {
  const ScoreScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Give up", style: buttonTextStyle),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScoreScreen())
        );
        if (isSoundOn) {
          audioPlayer.play(AssetSource('audio/90s-game-ui-6-185099.mp3'));
        }
      },
    );
  }
}

List<String> feedbackList = [
  'Welcome to Mastermind! In this game you will have to guess my secret code of four colors! Change the color of the circles by clicking on them!'
];