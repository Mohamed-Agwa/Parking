import 'dart:io';
import 'Resmode2.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'response_as_list.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'choice_screen.dart';
import 'card_generator.dart';
import 'loading.dart';
import 'choice_screen.dart';

class FirstModeScreen extends StatefulWidget {
  @override
  _FirstModeScreenState createState() => _FirstModeScreenState();
}

class _FirstModeScreenState extends State<FirstModeScreen> {
  void getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
  }

  // initState() {
  //   super.initState();
  //   dojob();
  // }

  // dojob() {
  //   data = getlist();
  //   print('start');
  // }

  // ignore: non_constant_identifier_names
  List<Parking> data = [];
  Widget build(BuildContext context) {
    data = getlist();
    double cwidth = MediaQuery.of(context).size.width * 0.8;
    // if (data == null) {
    //   Duration waiting = Duration(seconds: 20);
    //   sleep(waiting);
    //   print('waiting');
    // }
    return WillPopScope(
      onWillPop: () async {
        medium();
        return true;
      },
      child: Scaffold(
        backgroundColor: kBBackgroundColour,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: const Color(0xffffffff), //change your color here
          ),
          backgroundColor: kTBackgroundColour,
          centerTitle: true,
          title: Text(
            'PARKING',
            style: kChoice1TText,
          ),
        ),
        body: Container(
          // body: Stack(alignment: Alignment.center, children: <Widget>[
          //   data == null
          //       ? Loading()
          //       : Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 80,
                  color: const Color(0xfffee715),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${data[index].name}',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xff101820),
                              fontSize: 22),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${data[index].emptycount}'
                          "/"
                          '${data[index].totalcount}',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xff101820),
                              fontSize: 30),
                        ),
                      )
                      // Container(
                      //   width: cwidth,
                      //   child: Text(
                      //     '${data[index].name}'
                      //     "              "
                      //     '${data[index].emptycount}'
                      //     "/"
                      //     '${data[index].totalcount}',
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //         decoration: TextDecoration.none,
                      //         color: Colors.white,
                      //         fontSize: 30),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
            itemCount: data.length,
          ),
        ),
      ),
    );
  }
}
// List<CardGenerator> disp_parkings() {
//   print('entered');
//   List<Widget> entries = [];
//   for (var i = 0; i < spots.length; i++) {
//     var newItem = CardGenerator(
//       name: spots[i].name,
//       totalcount: spots[i].totalcount,
//       emptycount: spots[i].emptycount,
//     );
//     print(spots[i].name);
//     entries.add(newItem);
//   }
//   return entries;
// }
