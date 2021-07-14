import 'package:flutter/material.dart';
import 'constants.dart';
import 'response_as_list.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'choice_screen.dart';
import 'card_generator.dart';

class FirstModeScreen extends StatefulWidget {
  @override
  _FirstModeScreenState createState() => _FirstModeScreenState();
}

class _FirstModeScreenState extends State<FirstModeScreen> {
  List<Parking> data = getlist();
  void getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }
  // ignore: non_constant_identifier_names

  Widget build(BuildContext context) {
    double cwidth = MediaQuery.of(context).size.width * 0.8;
    print('start');
    return Scaffold(
      backgroundColor: kBBackgroundColour,
      appBar: AppBar(
        backgroundColor: kTBackgroundColour,
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 80,
                color: Colors.redAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${data[index].name}',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 30),
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
                            color: Colors.white,
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
