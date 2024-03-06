import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/screens/score_screen.dart';
import 'package:flutter_mastermind_sander/screens/settings_screen.dart';
import 'package:flutter_mastermind_sander/streams/stream_logic.dart';
import 'screens/start_screen.dart';
import 'screens/info_screen.dart';
import 'screens/game_screen.dart';
import 'variables.dart';


void main() {
  runApp(const MastermindApp());
}

class MastermindApp extends StatelessWidget {
  const MastermindApp({super.key});

  @override
  Widget build(BuildContext context) {
    readDouble('numOfTries', numOfTries).then((value) => numOfTries = value);
    readBool('isSoundOn', isSoundOn).then((value) => isSoundOn = value);
    readBool('isColorBlindModeOn', isColorBlindModeOn).then((value) => isColorBlindModeOn = value);
    readBool('isDevModeOn', isDevModeOn).then((value) => isDevModeOn = value);

    readList('highScoresStringList').then((value) => highScoresStringList = value ?? []);
    highScoresValues = highScoresStringList.map((e) {
      List<String> parts = e.split(',');
      String date = parts[0];
      String score = parts[1];

      return [date, score];
    }).toList();
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
            Stack(
                children: [
                  GameScreen(),
                  StreamBuilder<bool>(
                    initialData: false,
                    stream: StreamLogic.getStreamVisibility(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data == null) {
                        return AlertDialog(
                          title: Text('Error'),
                        );
                      }

                      bool visValue = snapshot.data!;
                      if (!visValue) return Container();
                      return Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Center(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(75),
                              side: BorderSide(
                                color: textColor,
                                width: 2.5
                              )
                            ),
                              child: ScoreScreen()
                          ),
                        ),
                      );
                    }
                  )
                ]),
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
