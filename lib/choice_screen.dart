import 'package:flutter/material.dart';
import 'constants.dart';
import 'choice_screen.dart';
import 'mode_1.dart';
import 'mode_2.dart';

class ChoiceScreen extends StatefulWidget {
  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBBackgroundColour,
      appBar: AppBar(
        backgroundColor: kTBackgroundColour,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            TextButton(
              child: Text(
                'View Available Parking Spots',
                style: kChoice1BText,
              ),
              onPressed: () {
                print("SUCCES");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FirstModeScreen();
                }));
              },
              style: kChoicesButtonStyle,
            ),
            SizedBox(
              height: 60,
            ),
            TextButton(
              child: Text(
                'Find nearest available spot',
                style: kChoice1BText,
              ),
              onPressed: () {
                print("SUCCES");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondModeScreen();
                }));
              },
              style: kChoicesButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
