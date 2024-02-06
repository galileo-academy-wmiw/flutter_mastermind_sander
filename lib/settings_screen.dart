import 'package:flutter/material.dart';
import 'package:flutter_mastermind_sander/variables.dart';

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
                            });
                          }),
                    ],
                  ),
                ),
                Text('Number of tries: $numOfTries'),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
