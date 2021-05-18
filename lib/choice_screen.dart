import 'package:flutter/material.dart';
import 'constants.dart';
import 'choice_screen.dart';

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
      body: Column(
        children: <Widget>[
          Row(),
          Row(),
        ],
      ),
    );
  }
}
