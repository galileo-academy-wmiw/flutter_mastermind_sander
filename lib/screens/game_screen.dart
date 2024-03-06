import 'dart:async';
import 'package:flutter/material.dart';
import '../variables.dart';
import 'dart:math';
import '../widgets/row_of_feedback.dart';





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
  controlFeedback.sort((a, b) => b - a);
  return controlFeedback;
}

// This builds the game
class GameScreen extends StatefulWidget {

  static StreamController<bool> notifier = StreamController.broadcast();


  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 2800,
        color: backgroundColor,
        child: StreamBuilder<bool>(
          stream: GameScreen.notifier.stream,
          builder: (context, _) {
            return Column(
              children: [
                FeedbackRow(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: allRows
                    ),
                  ),
                ),
              ],
            );
          }
        )
    );
  }
}

