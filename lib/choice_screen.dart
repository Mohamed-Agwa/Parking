import 'package:flutter/material.dart';
import 'package:parking/Resmode2.dart';
import "package:flutter/services.dart";
import 'constants.dart';
import 'package:geolocator/geolocator.dart';
import 'mode_1.dart';
import 'mode_2.dart';
import 'response_as_list.dart';

class ChoiceScreen extends StatefulWidget {
  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  // void getCurrentLocation() async {
  //   final position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   print(position);
  // }
  initState() {
    super.initState();
    medium2();
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: kBBackgroundColour,
      appBar: AppBar(
        backgroundColor: kTBackgroundColour,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: const Color(0xffffffff), //change your color here
        ),
        title: Text(
          'PARKING',
          style: kChoice1TText,
        ),
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
                print("SUCCESS");
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
                'Find Nearest Available Spot',
                style: kChoice1BText,
              ),
              onPressed: () {
                print("SUCCESS");
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
