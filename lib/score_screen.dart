import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_mastermind_sander/row_of_pins.dart';
import 'variables.dart';
import 'main.dart';

class ScoreScreen extends StatefulWidget {
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: pTextStyle,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: textColor,
          title: const Text("S C O R E", style: appBarTextStyle),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: backgroundColor,
          ),
        ),
        body: DefaultTextStyle(
          style: pTextStyle,
          child: Container(
            height: 2500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(18.0),
                  // TODO: Text is a placeholder
                  child: Text(
                    winStateAchieved ? 'Congratulations! You found my secret code!'
                        : 'Game over! My genius remains unmatched! This was my secret code:'
                  ),
                ),
                winStateAchieved ?
                Container() :
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 8.0),
                  child: RowOfPins(isForShowPurpose: true, codePinValues: secretCode,),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 8.0),
                  child: Table(
                    columnWidths: <int, TableColumnWidth>{
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    children: highScores,
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        highScoresValues.clear();
                        highScoresValues.add(['Date', 'Score']);
                        highScores.clear();
                        highScores = highScoresValues.map((highScore) {
                          return tableRowHighScore(highScore);
                        }).toList();
                      });
                    },
                    child: Text('Reset High Scores',
                      style: pTextStyle,
                    ),
                  ),
                ),
                Center(
                    child: ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back),
                            Text("Play again!", style: buttonTextStyle,),
                          ],
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          // Return to GameScreen
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const GameScreenRoute()));
                          resetGameState();
                          if (isSoundOn) {
                            // TODO: Sound is a placeholder
                            audioPlayer.play(AssetSource(codePinClickSound));
                          }
                        });
                      },
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}