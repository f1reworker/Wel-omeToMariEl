import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:welcome_to_mari_el/searchPage/DistrictsFilter.dart';
import 'package:welcome_to_mari_el/searchPage/searchFilter.dart';
import 'package:welcome_to_mari_el/placeList.dart';
import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/data.dart';

const PrimaryColor = Color(0xFFFFFEFC);
LatLng markerPosition = LatLng(56.63011039048471, 47.918735914174235);
final Set<Marker> markers = {};

class SearchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilteredPlace>(create: (_) => FilteredPlace()),
        ChangeNotifierProvider<DistrictsFil>(create: (_) => DistrictsFil()),
      ],
      child: Scaffold(
        body: Container(
          color: PrimaryColor,
          child: Column(children: <Widget>[
            SearchBar(),
            DistrictsFilter(),
            SearchFilter(),
            Flexible(
              child: PlaceList(),
            ),
          ]),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final void Function(String) onTextChange;

  SearchBar({this.onTextChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: EdgeInsets.all(10),
        child: TextField(
            onChanged: onTextChange,
            decoration: InputDecoration(
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search something ...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero)));
  }
}

class DistrictsFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: PrimaryColor),
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: PrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(40.0)),
          ),
          child: Row(children: [
            Icon(
              Icons.add,
              color: Colors.black,
            ),
            Text("     Добавить фильтры районов",
                style: new TextStyle(fontSize: 15.0, color: Colors.black)),
          ]),
          onPressed: () {
            showAlertDialogDistricts(context);
          },
        ));
  }
}

class SearchFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: PrimaryColor),
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: PrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(40.0)),
          ),
          child: Row(children: [
            Icon(Icons.add, color: Colors.black),
            Text(
              "     Добавить фильтры поиска",
              style: new TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ]),
          onPressed: () {
            showAlertDialogSearch(context);
          },
        ));
  }
}
