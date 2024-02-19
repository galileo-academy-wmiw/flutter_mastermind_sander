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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: textColor,
        shape: StadiumBorder(
          side: BorderSide(
            color: textColor,
            width: 2.5
          )
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<Object>(
                    stream: GameScreen.notifier.stream,
                    builder: (context, snapshot) {
                      return Text('Tries left: ${numOfTries - (allRows.length - 2)}',
                      style: appBarTextStyle,);
                    }
                  ),
                  ScoreScreenButton()
                ],
              ),
            ),
            Container(
              height: 50,
              child: Text(feedbackList[0], style: appBarTextStyle,),
            )
          ],
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
          audioPlayer.play(AssetSource('audio/up-chime-2.mp3'));
        }
      },
    );
  }
}

List<String> feedbackList = [
  'Welcome to Mastermind! In this game you will have to guess my secret code of four colors'
];