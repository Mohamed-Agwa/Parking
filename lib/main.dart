import 'package:flutter/material.dart';
import 'constants.dart';
import 'choice_screen.dart';
import 'welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
