import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/mainPage/navigationButton.dart';
import 'package:welcome_to_mari_el/searchPage/searchBar.dart';
import 'package:location/location.dart';
//import 'package:welcome_to_mari_el/data.dart';

LatLng _center = LatLng(56.6388, 47.8908);

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
        //Buttons(),
        SearchButton(),
      ],
    );
  }
}
