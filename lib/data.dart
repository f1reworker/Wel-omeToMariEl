import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:welcome_to_mari_el/searchPage/DistrictsFilter.dart';
import 'package:welcome_to_mari_el/searchPage/SearchFilter.dart';

List _data1 = districtsCheck;
List _data2 = searchCheck;

class DistrictsFil with ChangeNotifier {
  List get getData1 => _data1;
  List get getData2 => _data2;
  void changeString1(districtsCheck) {
    _data1 = districtsCheck;
    notifyListeners();
  }

  void changeString2(searchCheck) {
    _data2 = searchCheck;
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
