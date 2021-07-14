import 'package:flutter/material.dart';
import 'constants.dart';
import 'loading.dart';
import 'dart:collection';
import 'dart:async';
import 'dart:io';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:matrix2d/matrix2d.dart';
// import 'package:location_permissions/location_permissions.dart';
// import 'package:permission/permission.dart';
import 'choice_screen.dart';

// enum PermissionGroup {
//   /// Android: Fine and Coarse Location
//   /// iOS: CoreLocation - Always
//   locationAlways,
//
//   /// Android: Fine and Coarse Location
//   /// iOS: CoreLocation - WhenInUse
//   locationWhenInUse
// }

// final alwaysGranted =
//     [PermissionGroup.locationAlways] == PermissionStatus.allow;
// final whenInUseGranted =
//     [PermissionGroup.locationWhenInUse] == PermissionStatus.allow;

class SecondModeScreen extends StatefulWidget {
  @override
  _SecondModeScreenState createState() => _SecondModeScreenState();
}

class _SecondModeScreenState extends State<SecondModeScreen> {
  LatLng _initialPosition;
  LatLng destination;
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  Set<Circle> _circles = HashSet<Circle>();
  bool _showMapStyle = false;

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  @override
  var locationMessage = "";
  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(position);

    setState(() {
      locationMessage = "${position.latitude}, ${position.longitude}";
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
    _setDestination();
  }

  void initState() {
    super.initState();
    polylinePoints = PolylinePoints();
    // _setMarkerIcon();
    // _setPolylines();
    // _setCircles();
  }

  // void _toggleMapStyle() async {
  //   String style = await DefaultAssetBundle.of(context)
  //       .loadString('assets/map_style.json');
  //
  //   if (_showMapStyle) {
  //     _mapController.setMapStyle(style);
  //   } else {
  //     _mapController.setMapStyle(null);
  //   }
  // }
  var locationMessage1 = "";

  void _setDestination() {
    // if (_initialPosition == Null) {
    //   Duration waiting = Duration(seconds: 5);
    //   sleep(waiting);
    // }
    List<LatLng> latlongs = [];
    latlongs.add(LatLng(31.209917900340493, 29.922046363760366));
    latlongs.add(LatLng(31.209875873502863, 29.922083607312754));
    latlongs.add(LatLng(31.20980590823376, 29.92212867612264));
    latlongs.add(LatLng(31.20972917125228, 29.92218184849088));
    int size = latlongs.length;
    int j = 0;
    int z = 0;
    int y = 0;
    List helper =
        List.generate(size, (i) => List.filled(3, 0.0), growable: false);

    for (j; j < size; j++) {
      helper[j][2] = latlongs[j].latitude;
      helper[j][1] = latlongs[j].longitude;
      helper[j][0] = Geolocator.distanceBetween(
          _initialPosition.latitude,
          _initialPosition.longitude,
          latlongs[j].latitude,
          latlongs[j].longitude);
    }
    print(helper);
    List<double> distances = [];
    for (z; z < size; z++) {
      distances.add(helper[z][0]);
    }
    distances.sort();
    double mindis = distances[0];
    for (y; y < size; y++) {
      if (mindis == helper[y][0]) {
        destination = LatLng(helper[y][2], helper[y][1]);
      }
    }
    print(destination);
  }

  // void setPolylines() async {
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       "AIzaSyBgYrqyRj4_HvAnXU-4q250AFQGuWgWggA",
  //       PointLatLng(_initialPosition.latitude, _initialPosition.longitude),
  //       PointLatLng(destination.latitude, destination.longitude));
  //   result.points.forEach((PointLatLng point) {
  //     polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //   });
  //
  //   setState(() {
  //     _polylines.add(Polyline(
  //         width: 10,
  //         polylineId: PolylineId('polyLine'),
  //         color: Color(0xFF08A5CB),
  //         points: polylineCoordinates));
  //   });
  //
  //   if (result.status == 'OK') {
  //   } else {
  //     print("Can't get route");
  //   }
  // }
  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBgYrqyRj4_HvAnXU-4q250AFQGuWgWggA",
        PointLatLng(_initialPosition.latitude, _initialPosition.longitude),
        PointLatLng(destination.latitude, destination.longitude));

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
        _polylines.add(Polyline(
            width: 10,
            polylineId: PolylineId('polyLine'),
            color: Color(0xFF08A5CB),
            points: polylineCoordinates));
      });
    }
  }
  // void _setPolylines() {
  //   List<LatLng> polylineLatLongs = List<LatLng>();
  //   polylineLatLongs.add(LatLng(37.74493, -122.42932));
  //   polylineLatLongs.add(LatLng(37.74693, -122.41942));
  //   polylineLatLongs.add(LatLng(37.74923, -122.41542));
  //   polylineLatLongs.add(LatLng(37.74923, -122.42582));
  //
  //   _polylines.add(
  //     Polyline(
  //       polylineId: PolylineId("0"),
  //       points: polylineLatLongs,
  //       color: Colors.purple,
  //       width: 1,
  //     ),
  //   );
  // }

  // void _setCircles() {
  //   _circles.add(
  //     Circle(
  //         circleId: CircleId("0"),
  //         center: LatLng(37.76493, -122.42432),
  //         radius: 1000,
  //         strokeWidth: 2,
  //         fillColor: Color.fromRGBO(102, 51, 153, .5)),
  //   );
  // }
  // Future<dynamic> getLocation() async {
  //   Fetch_location location = Fetch_location();
  //   await location.getCurrentLocation();
  //
  //   return location;
  // }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setPolylines();
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: _initialPosition,
          infoWindow: InfoWindow(
            title: "Current Location",
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: destination,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(
            title: "Destination",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();

    // print(getLocation());
    // var pos = getLocation();
    // print(pos);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Map'),
        backgroundColor: kTBackgroundColour,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _initialPosition == null
              ? Loading()
              : GoogleMap(
                  polylines: _polylines,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 15,
                  ),
                  markers: _markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
        ],
      ),
    );
  }
}
