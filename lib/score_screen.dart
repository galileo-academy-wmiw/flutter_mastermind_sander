import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_mastermind_sander/game_screen.dart';
import 'theme.dart';

class ScoreScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: pTextStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(18.0),
            child: Text('Placeholder text'),
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
                  Navigator.pop(context);
                  audioPlayer.play(AssetSource('audio/up-chime-2.mp3'));
                },
              )
          ),
        ],
      ),
    );
  }
}