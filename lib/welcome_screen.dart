import 'package:flutter/material.dart';
import 'constants.dart';
import 'choice_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBBackgroundColour,
      appBar: AppBar(
        backgroundColor: kTBackgroundColour,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage("images/welcome.jpg"),
            ),
            TextButton(
                child: Text(
                  'Let\'s Go',
                  style: kButton1TextStyle,
                ),
                onPressed: () {
                  print("SUCCES");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChoiceScreen();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
