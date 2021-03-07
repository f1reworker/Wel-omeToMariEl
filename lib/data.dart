import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DistrictsFil with ChangeNotifier {
  String _data = "";
  String get getData => _data;
  void changeString(districtsString) {
    _data = districtsString;

    notifyListeners();
  }
}

class SearchFil with ChangeNotifier {
  String _data = "";
  String get getData => _data;
  void changeString(searchString) {
    _data = searchString;
    notifyListeners();
  }
}

class Markers with ChangeNotifier {
  LatLng _data;
  LatLng get getData => _data;
  void changeLatLng(markers) {
    _data = markers;
    notifyListeners();
  }
}

class MyMapType with ChangeNotifier {
  MapType _data;
  MapType get getData => _data;
  void changeLatLng(_currentMapType) {
    _data = _currentMapType;
    notifyListeners();
  }
}
