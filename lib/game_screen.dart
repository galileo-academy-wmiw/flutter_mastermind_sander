import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/score_screen.dart';
import 'scorepin.dart';
import 'package:audioplayers/audioplayers.dart';
import 'theme.dart';
import 'variables.dart';


// Constructor for the widget of a row of pins that will make up the stages of the game
class RowOfPins extends StatefulWidget {
  const RowOfPins({super.key});

  @override
  State<RowOfPins> createState() => _RowOfPinsState();
}

class _RowOfPinsState extends State<RowOfPins> {

  int index = 0;
  int i = 0;
  int j = 0;
  int k = 0;
  int l = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  index = 0;
                  i++;
                  if (i > 6) i = 1;
                  codePinColorSequence[index] = i;
                });
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colorList[i],
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 7.5,
                    color: textColor,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            )
        ),
        Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  index = 1;
                  j++;
                  if (j > 6) j = 1;
                  codePinColorSequence[index] = j;
                });
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colorList[j],
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 7.5,
                    color: textColor,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            )
        ),
        Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  index = 2;
                  k++;
                  if (k > 6) k = 1;
                  codePinColorSequence[index] = k;
                });
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colorList[k],
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 7.5,
                    color: textColor,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            )
        ),
        Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  index = 3;
                  l++;
                  if (l > 6) l = 1;
                  codePinColorSequence[index] = l;
                });
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colorList[l],
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 7.5,
                    color: textColor,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            )
        ),
        Expanded(
            child: Center(
              child: IconButton(
                onPressed: (){
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
            children: [
              Container(
                height: 100,
                  child: const RowOfPins()
              ),
              const ScoreScreenButton(),
            ]
        )
    );
  }
}