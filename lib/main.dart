import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/start-screen.dart';
import 'package:flutter_mastermind_sander/info-screen.dart';
import 'package:flutter_mastermind_sander/score-screen.dart';
import 'package:flutter_mastermind_sander/game-screen.dart';


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
          backgroundColor: Colors.purple[800],
          foregroundColor: Colors.white,
        ),
        body: Center(child: GameScreen()),
      ),
    );
  }
}
