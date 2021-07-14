import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: SpinKitFadingCircle(
                  color: kTBackgroundColour,
                  size: 50.0,
                ),
              ),
              Center(
                child: Text(
                  'Please wait while we fetch your nearest parking spot',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ]));
  }
}
