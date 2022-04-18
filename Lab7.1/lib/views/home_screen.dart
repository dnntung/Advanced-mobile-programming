import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<StatefulWidget> {
  late LatLng userPosition;
  List<Marker> markers = [];

  @override
  void setState(VoidCallback fn) {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home screen'),),
      body: FutureBuilder(
        future: findUserLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: snapshot.data, zoom: 15
              ),
              markers: Set<Marker>.of(markers),
            );
          } else {
            return _setLoading();
          }
        },
      )
    );
  }

  Widget _setLoading() {
    return Scaffold(
      body: _setContentLoading(),
    );
  }

  Widget _setContentLoading() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Please wait',
            style: const TextStyle(fontSize: 25, color: Colors.blueAccent),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Future<LatLng> findUserLocation() async {
    Location location = Location();
    LocationData userLocation;
    PermissionStatus hasPermission = await
    location.hasPermission();
    bool active = await location.serviceEnabled();
    if (hasPermission == PermissionStatus.granted && active) {
      userLocation = await location.getLocation();

      userPosition = LatLng(userLocation.latitude as double,
          userLocation.longitude as double);
    } else {
      print('Use default location...');
      // TDT University
      userPosition = LatLng(10.732869174213993, 106.69973741130023);
    }

    // Display marker at the user position
    if (markers.isEmpty) {
      markers.add(buildMaker(userPosition));
    } else {
      markers[0] = buildMaker(userPosition);
    }

    setState(() { });

    return userPosition;
  }

  Marker buildMaker(LatLng pos) {
    MarkerId markerId = MarkerId('H');
    Marker marker = Marker(
      markerId: markerId,
      position: pos
    );

    return marker;
  }

}