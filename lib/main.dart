import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/settings_screen.dart';
import 'start_screen.dart';
import 'info_screen.dart';
import "game_screen.dart";
import 'variables.dart';


void main() {
  runApp(const MastermindApp());
}

class MastermindApp extends StatelessWidget {
  const MastermindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        backgroundColor: backgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()));
                },
                icon: Icon(
                  Icons.settings,
                  color: backgroundColor,
                ),
            ),
          ],
          backgroundColor: textColor,
          iconTheme: IconThemeData(
            color: backgroundColor,
          ),
          title: const Text("M A S T E R M I N D", style: appBarTextStyle),
          centerTitle: true,
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
      backgroundColor: backgroundColor,
      body: StartScreen(),
    );
  }
}
