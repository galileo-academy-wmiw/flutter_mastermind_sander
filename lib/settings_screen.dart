import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/variables.dart';
import 'main.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The settings screen is the screen where the user can change settings for sound,
// accessibility and difficulty.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textColor,
        title: const Text("S E T T I N G S", style: appBarTextStyle),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: backgroundColor,
        ),
      ),
      body: DefaultTextStyle(
        style: pTextStyle,
        child: Center(
          child: Container(
            width: 600,
            child: Column(
              children: [
                // Button to turn sound on/off
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sound:'),
                      Switch(
                          value: isSoundOn,
                          onChanged: (value){
                            setState(() {
                              isSoundOn = !isSoundOn;
                            });
                          }),
                      if (isSoundOn == true) Icon(
                        Icons.volume_up_rounded,
                        color: primaryColor,
                      )
                      else Icon(
                        Icons.volume_off_rounded,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
                // Button to turn colorblind mode on/off
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Colorblind Mode:'),
                      Switch(
                          value: isColorBlindModeOn,
                          onChanged: (value){
                            setState(() {
                              isColorBlindModeOn = !isColorBlindModeOn;
                              resetGameState();
                            });
                          }),
                    ],
                  ),
                ),
                // Label for slider below
                Text('Number of tries: $numOfTries'),
                // Slider to set the number of tries
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slider(
                      value: numOfTries,
                      min: 10,
                      max: 20,
                      divisions: 10,
                      label: numOfTries.toString(),
                      onChanged: (double value) {
                        setState(() {
                          numOfTries = value;
                        });
                      }
                  ),
                ),
                // Button that applies the changes and resets the game
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const GameScreenRoute()),
                        );
                        saveDouble('numOfTries', numOfTries);
                        saveBool('isSoundOn', isSoundOn);
                        saveBool('isColorBlindModeOn', isColorBlindModeOn);
                        saveBool('isDevModeOn', isDevModeOn);
                        if (isSoundOn) {
                          audioPlayer.play(AssetSource(startUpSound));
                        }
                        resetGameState();
                      },
                      child: Text('Apply', style: buttonTextStyle,)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
