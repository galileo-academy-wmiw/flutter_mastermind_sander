import 'package:flutter/material.dart';
import 'start-screen.dart';
import 'info-screen.dart';
import 'score-screen.dart';
import "game-screen.dart";


void main() {
  runApp(const MastermindApp());
}

class MastermindApp extends StatelessWidget {
  const MastermindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("M A S T E R M I N D"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(60, 7, 83, 1),
          foregroundColor: Color.fromRGBO(145, 10, 103, 1),
        ),
        body: GameScreen(),
      ),
    );
  }
}
