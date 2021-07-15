import 'dart:convert';
import 'dart:io';
import 'request_handler.dart';

class Parking {
  String name;
  int totalcount;
  int emptycount;

  Parking(this.name, this.totalcount, this.emptycount);

  factory Parking.fromJson(dynamic json) {
    return Parking(json['name'] as String, json['totalcount'] as int,
        json['emptycount'] as int);
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.totalcount}, ${this.emptycount} }';
  }
}

String arrayText = "";
Future<String> getres() async {
  NetworkHelper networkHelper = NetworkHelper(
      Uri.parse('https://desolate-castle-57587.herokuapp.com/mode1'));
  final response = await networkHelper.getData();
  return response;
}

Future<void> medium() async {
  String arrrayText = await getres();
  arrayText = arrrayText;
  print(arrayText);
}

List getlist() {
  if (arrayText == "") {
    getlist();
  } else {
    var parkingObjsJson = json.decode(arrayText)['parking'] as List;
    List<Parking> parkingObjs = parkingObjsJson
        .map((parkingJson) => Parking.fromJson(parkingJson))
        .toList();
    // for (var i = 0; i < parkingObjs.length; i++) {
    //   parkingObjs[i].emptycount = 100 - parkingObjs[i].emptycount;
    // }
    return parkingObjs;
  }
  // if (data == null) {
  //   Duration waiting = Duration(seconds: 20);
  //   sleep(waiting);
  //   print('waiting');
  // }
  // String arrayText =
  //     '{"parking": [{"name": "Carrefour","totalcount": 100,"emptycount": 52},{"name": "Smouha","totalcount": 100,"emptycount": 43},{"name": "Sporting","totalcount": 100,"emptycount": 41}] } ';
  // print('waiting');
  // Duration waiting = Duration(seconds: 5);
  // sleep(waiting);
  // print("RUN ME AGAIN");
  // print(parkingObjs);
  // print(parkingObjs.length);
  // print(parkingObjs.first.name);
  // print(parkingObjs[2]);
}
