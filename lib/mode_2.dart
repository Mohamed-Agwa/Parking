import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:collection';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';
import 'choice_screen.dart';

class SecondModeScreen extends StatefulWidget {
  @override
  _SecondModeScreenState createState() => _SecondModeScreenState();
}

class _SecondModeScreenState extends State<SecondModeScreen> {
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();
  bool _showMapStyle = false;

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    // _setMarkerIcon();
    _setDestination();
    // _setPolylines();
    // _setCircles();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/noodle_icon.png');
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

  void _setDestination() {
    List<LatLng> LatLongs = List<LatLng>();
    LatLongs.add(LatLng(37.78493, -122.42932));
    LatLongs.add(LatLng(37.78693, -122.41942));
    LatLongs.add(LatLng(37.78923, -122.41542));
    LatLongs.add(LatLng(37.78923, -122.42582));
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

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(31.21564, 29.95527),
          infoWindow: InfoWindow(
            title: "Alexandria,Egypt",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Map'),
        backgroundColor: kTBackgroundColour,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(31.21564, 29.95527),
              zoom: 15,
            ),
            markers: _markers,
            // polygons: _polygons,
            // polylines: _polylines,
            // circles: _circles,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          // Container(
          //   alignment: Alignment.bottomCenter,
          //   padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
          //   child: Text("Coding with Curry"),
          // )
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Increment',
      //   child: Icon(Icons.map),
      //   onPressed: () {
      //     setState(() {
      //       _showMapStyle = !_showMapStyle;
      //     });
      //
      //     // _toggleMapStyle();
      //   },
      // ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: kBBackgroundColour,
  //     appBar: AppBar(
  //       backgroundColor: kTBackgroundColour,
  //     ),
  //   );
}
