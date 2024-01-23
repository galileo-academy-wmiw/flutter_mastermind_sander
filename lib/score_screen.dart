import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back),
                Text("Play again!"),
              ],
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
    );
  }
}