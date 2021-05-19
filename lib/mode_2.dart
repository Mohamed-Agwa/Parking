import 'package:flutter/material.dart';
import 'constants.dart';
import 'choice_screen.dart';

class SecondModeScreen extends StatefulWidget {
  @override
  _SecondModeScreenState createState() => _SecondModeScreenState();
}

class _SecondModeScreenState extends State<SecondModeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBBackgroundColour,
      appBar: AppBar(
        backgroundColor: kTBackgroundColour,
      ),
    );
  }
}
