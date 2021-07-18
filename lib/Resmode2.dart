import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'constants.dart';
import 'loading.dart';
import 'dart:collection';
import 'package:geolocator/geolocator.dart';
import 'request_handler.dart';

class Spot {
  String id;
  double lat;
  double long;
  bool empty;

  Spot(this.id, this.lat, this.long, this.empty);

  factory Spot.fromJson(dynamic json) {
    return Spot(json['id'] as String, json['lat'] as double,
        json['long'] as double, json['empty'] as bool);
  }

  @override
  String toString() {
    return '{ ${this.lat} , ${this.long}}';
  }
}

String arrayText2 = "";
LatLng _initialPosition;
void Loc1() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation);
  // locationMessage = "${position.latitude}, ${position.longitude}";
  _initialPosition = LatLng(position.latitude, position.longitude);
}

Future<String> getres2() async {
  NetworkHelper networkHelper = NetworkHelper(Uri.parse(
      'https://desolate-castle-57587.herokuapp.com/mode2/${_initialPosition.latitude}/${_initialPosition.longitude}'));
  final response = await networkHelper.getData();
  return response;
}

Future<void> medium2() async {
  String arrrayText2 = await getres2();
  arrayText2 = arrrayText2;
}

List<LatLng> Getclosest() {
  final jsonString = arrayText2;
  // Use jsonDecode function to decode the JSON string
  // I assume the JSON format is correct
  final json = jsonDecode(jsonString);

  // The JSON data is an array, so the decoded json is a list.
  // We will do the loop through this list to parse objects.
  List speot1 = [];
  List<LatLng> latlongs = [];
  List speot2 = [];
  if (json != null) {
    json.forEach((element) {
      final spot = Spot.fromJson(element);
      String speot = spot.toString();
      String result = speot.replaceAll("{", "");
      String result1 = result.replaceAll("}", "");
      speot1 = speot1 + result1.split(",");
    });
  }
  int j = (speot1.length / 2).toInt();

  for (int i = 0; i < j; i++) {
    latlongs.add(
        LatLng(double.parse(speot1[2 * i]), double.parse(speot1[(2 * i) + 1])));
  }
  return latlongs;
}
