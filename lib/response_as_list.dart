import 'dart:convert';

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

List getlist() {
  String arrayText =
      '{"parking": [{"name": "Carrefour","totalcount": 100,"emptycount": 52},{"name": "Smouha","totalcount": 100,"emptycount": 43},{"name": "Sporting","totalcount": 100,"emptycount": 41}] } ';

  var parkingObjsJson = json.decode(arrayText)['parking'] as List;
  List<Parking> parkingObjs = parkingObjsJson
      .map((parkingJson) => Parking.fromJson(parkingJson))
      .toList();
  for (var i = 0; i < parkingObjs.length; i++) {
    parkingObjs[i].emptycount = 100 - parkingObjs[i].emptycount;
  }
  return parkingObjs;
  print(parkingObjs);
  print(parkingObjs.length);
  print(parkingObjs.first.name);
  print(parkingObjs[2]);
}
