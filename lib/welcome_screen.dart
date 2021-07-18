import 'package:flutter/material.dart';
import 'package:parking/Resmode2.dart';
import 'constants.dart';
import 'choice_screen.dart';
import 'response_as_list.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  initState() {
    super.initState();
    Loc1();
    medium();
  }

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
            SizedBox(
              height: 55,
            ),
            Image(
              image: AssetImage("images/welcome.jpg"),
            ),
            SizedBox(
              height: 125,
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
                },
                style: kButton1ButtonStyle),
          ],
        ),
      ),
    );
  }
}
