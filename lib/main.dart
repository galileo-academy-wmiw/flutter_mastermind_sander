import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'info_screen.dart';
import "game_screen.dart";


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
      home: const StartScreenRoute(),
    );
  }
}

class GameScreenRoute extends StatelessWidget {
  const GameScreenRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("M A S T E R M I N D"),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(3, 6, 55, 1),
          foregroundColor: Colors.white,
        ),
        body: TabBarView(
          children: [
            GameScreen(),
            InfoScreen(),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.gamepad)),
            Tab(icon: Icon(Icons.info)),
          ],
        ),
      ),
    );
  }
}

class StartScreenRoute extends StatelessWidget {
  const StartScreenRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StartScreen(),
    );
  }
}
