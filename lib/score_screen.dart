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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(18.0),
            // TODO: Text is a placeholder
            child: Text('Placeholder text'),
          ),
          Container(
            child: RowOfPins(isForShowPurpose: true, codePinValues: secretCode,),
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
    );
  }
}