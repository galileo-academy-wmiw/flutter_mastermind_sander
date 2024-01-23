import 'package:flutter/material.dart';
import 'codepin.dart';
import 'scorepin.dart';

// Constructor for the rows of pin that will make up the stages of the game
class RowOfPins extends StatelessWidget {
  const RowOfPins({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
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

// This builds the game
class GameScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        height: 2200,
        color: Color.fromRGBO(145, 10, 103, 1),
        child: ListView(
            children: [
              RowOfPins(),
            ]
        )
    );
  }
}