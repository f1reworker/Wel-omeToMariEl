import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:welcome_to_mari_el/mainPage/navigationButton.dart';
import 'package:welcome_to_mari_el/placeList.dart';
import 'package:welcome_to_mari_el/placeListTab.dart';
import 'package:location/location.dart';
import 'package:welcome_to_mari_el/main.dart';

LatLng _center = LatLng(56.6388, 47.8908);
final Set<Marker> markers = {};

void onAddMarker(indexPlace) {
  BitmapDescriptor colorMarker;
  void colorize(indexPlace) {
    switch (place[indexPlace]["id"].split("")[1]) {
      case "9":
        colorMarker =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
        break;
      case "1":
        colorMarker =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
        break;
      case "2":
        colorMarker =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan);
        break;
      case "3":
        colorMarker =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
        break;
      case "4":
        colorMarker =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta);
        break;
      case "5":
        colorMarker =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta);
        break;
      case "6":
        colorMarker =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
        break;
      case "7":
        colorMarker =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
        break;
      case "8":
        colorMarker =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
        break;
    }
  }

  markers.clear();
  for (int i = 0; i < prefs.getStringList('listIndex').length; i++) {
    colorize(int.parse(prefs.getStringList('listIndex')[i]));
    LatLng location = LatLng(
        double.parse(place[int.parse(prefs.getStringList('listIndex')[i])]
                ["location"]
            .split(",")[0]),
        double.parse(place[int.parse(prefs.getStringList('listIndex')[i])]
                ["location"]
            .split(",")[1]));
    markers.add(Marker(
      markerId: MarkerId(prefs.getStringList('listIndex')[i]),
      position: location,
      infoWindow: InfoWindow(
        title: place[int.parse(prefs.getStringList('listIndex')[i])]["name"],
      ),
      icon: colorMarker,
      //onTap: MapState().showAlertDialogMarker(),
    ));
  }
}

class Map extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
  void initState() {
    super.initState();
    const oneSecond = const Duration(seconds: 3);
    new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
  }

  // showAlertDialogMarker() {
  //   print("object");
  //   AlertDialog alert = AlertDialog(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(30))),
  //       title: Text("Выберите районы:"),
  //       content: TextButton(
  //         onPressed: () {},
  //         child: Container(
  //             height: 122.4,
  //             width: MediaQuery.of(context).size.width - 100,
  //             child: Row(children: <Widget>[
  //               Container(
  //                 child: Text("marker"),
  //                 //   child: TextButton(
  //                 //     onPressed: () {
  //                 //       indexPlace = place.indexOf(favOrSearch[index]);
  //                 //       Navigator.pushNamed(context, '/place');
  //                 //     },
  //                 //     style: ElevatedButton.styleFrom(
  //                 //         primary: Colors.white, onPrimary: Colors.black),
  //                 //     child: Row(
  //                 //       children: <Widget>[
  //                 //         Align(
  //                 //           alignment: Alignment.centerLeft,
  //                 //           child: Container(
  //                 //             width: 70,
  //                 //             decoration: BoxDecoration(shape: BoxShape.circle),
  //                 //             child:
  //                 //                 Image.network(favOrSearch[index]["photo"][0]),
  //                 //           ),
  //                 //         ),
  //                 //         Column(children: <Widget>[
  //                 //           Row(
  //                 //             mainAxisAlignment: MainAxisAlignment.start,
  //                 //             children: <Widget>[
  //                 //               SizedBox(width: 10),
  //                 //               Container(
  //                 //                 width:
  //                 //                     MediaQuery.of(context).size.width - 141,
  //                 //                 child: Text(
  //                 //                   favOrSearch[index]["name"],
  //                 //                   softWrap: true,
  //                 //                   textAlign: TextAlign.left,
  //                 //                   style: new TextStyle(
  //                 //                     fontSize: 15.0,
  //                 //                   ),
  //                 //                 ),
  //                 //               ),
  //                 //             ],
  //                 //           ),
  //                 //           Text(
  //                 //             favOrSearch[index]["district"],
  //                 //             textAlign: TextAlign.left,
  //                 //             style: new TextStyle(
  //                 //               color: Colors.black54,
  //                 //             ),
  //                 //           ),
  //                 //           Text(
  //                 //             "Расстояние: " +
  //                 //                 calculateDistance(
  //                 //                         place.indexOf())
  //                 //                     .toStringAsFixed(2) +
  //                 //                 " км",
  //                 //             textAlign: TextAlign.left,
  //                 //             style: new TextStyle(
  //                 //               color: Colors.black54,
  //                 //             ),
  //                 //           ),
  //                 //         ]),
  //                 //       ],
  //                 //     ),
  //                 //   ),
  //               ),
  //             ])),
  //       ));

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  Completer<GoogleMapController> _controller = Completer();

  MapType _currentMapType = MapType.normal;
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
    _center = LatLng(currentLocation.latitude, currentLocation.longitude);
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
          compassEnabled: false,
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
