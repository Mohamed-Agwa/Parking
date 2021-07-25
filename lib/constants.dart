import 'package:flutter/material.dart';

Color kTBackgroundColour = const Color(0xff101820);
Color kBBackgroundColour = const Color(0xf4ffffff);
const kIconColour = Colors.teal;
const kButton1TextStyle = TextStyle(
  fontSize: 25.0,
  color: const Color(0xff101820),
);
var kButton1ButtonStyle = TextButton.styleFrom(
  backgroundColor: const Color(0xfffee715),
  primary: Colors.black45,
  // side: BorderSide(color: Colors.yellow, width: 3.0),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
      side: BorderSide(color: Colors.yellow, width: 3.0)),
  padding: EdgeInsets.all(10.0),
  minimumSize: Size(175, 70),
);
const kChoice1BText = TextStyle(
  fontSize: 22.0,
  color: const Color(0xff101820),
);
const kChoice1TText = TextStyle(
  fontSize: 25.0,
  color: const Color(0xffffffff),
  // color: Colors.white,
);
var kChoicesButtonStyle = TextButton.styleFrom(
  backgroundColor: const Color(0xfffee715),
  primary: Colors.black45,
  // side: BorderSide(color: Colors.yellow, width: 3.0),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(color: Colors.yellow, width: 3.0)),
  padding: EdgeInsets.all(10.0),
  minimumSize: Size(300, 70),
);
