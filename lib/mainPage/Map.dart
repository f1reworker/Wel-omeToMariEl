import 'dart:async';
//import 'package:geocoding/geocoding.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:welcome_to_mari_el/searchPage/searchBar.dart';
//import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/mainPage/navigationButton.dart';
import 'package:welcome_to_mari_el/placeListTab.dart';
import 'dart:math' show cos, sqrt, asin;
import 'package:welcome_to_mari_el/data.dart';
import 'package:location/location.dart';

LatLng _center = LatLng(56.6388, 47.8908);

class Secrets {
  // Add your Google Maps API Key here
  static const API_KEY = 'AIzaSyCyA0gC2lsmH8NndQGx802x2eaiFcY1uJI';
}

class Map extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  MapType _currentMapType = MapType.normal;

  void onAddMarkerButtonPressed() {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(markerPosition.toString()),
        position: markerPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
    var fff = place[1]["location"].split(",");
    double latitude = double.parse(fff[0]);
    double longitude = double.parse(fff[1]);
    LatLng location = new LatLng(latitude, longitude);
    print(location);
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(markerPosition.toString()),
        position: location,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
    ));
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          mapType: _currentMapType,
          markers: markers,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          zoomGesturesEnabled: true,
          compassEnabled: true,
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: <Widget>[
                SizedBox(height: 80),
                Container(
                  height: 60,
                  width: 60,
                  child: FloatingActionButton(
                    heroTag: null,
                    onPressed: _onMapTypeButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: MyRed,
                    child: const Icon(Icons.map, size: 45.0),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  width: 60,
                  child: FloatingActionButton(
                    heroTag: null,
                    onPressed: _currentLocation,
                    backgroundColor: MyRed,
                    child: const Icon(Icons.my_location, size: 45.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        SearchButton(),
      ],
    );
  }
}
