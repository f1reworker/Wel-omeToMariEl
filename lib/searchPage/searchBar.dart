import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:welcome_to_mari_el/searchPage/DistrictsFilter.dart';
import 'package:welcome_to_mari_el/searchPage/searchFilter.dart';
import 'package:welcome_to_mari_el/mainPage/Map.dart';

const PrimaryColor = Color(0xFFFFFEFC);
LatLng markerPosition = LatLng(56.63011039048471, 47.918735914174235);
final Set<Marker> markers = {};

class SearchList extends StatefulWidget {
  @override
  SearchListState createState() => new SearchListState();
}

class SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PrimaryColor,
        child: Column(children: <Widget>[
          SearchBar(),
          DistrictsFilter(),
          SearchFilter(),
          Fil(),
          Flexible(
            child: PlaceList(),
          ),
        ]),
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
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          child: Row(children: [
            Icon(Icons.add),
            Text("     Добавить фильтры районов"),
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
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          child: Row(children: [
            Icon(Icons.add),
            Text("     Добавить фильтры поиска"),
          ]),
          onPressed: () {
            showAlertDialogSearch(context);
          },
        ));
  }
}

class Fil extends StatefulWidget {
  @override
  FilState createState() => new FilState();
}

class FilState extends State<Fil> {
  @override
  Widget build(BuildContext context) {
    districtsCheckFunc();
    searchCheckFunc();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: PrimaryColor),
            margin: EdgeInsets.all(10),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0)),
                child: Row(children: [
                  Icon(Icons.check),
                  Text("     Применить фильтры"),
                ]),
                onPressed: () {
                  setState(() {
                    districtsCheckFunc();
                    searchCheckFunc();
                  });
                }),
          ),
          Text(districtsString),
          Text(searchString),
        ],
      ),
    );
  }
}

class PlaceList extends StatefulWidget {
  PlaceList({Key key}) : super(key: key);

  @override
  _PlaceListState createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: <Widget>[
          Row(children: <Widget>[
            Text("Place 1"),
            RaisedButton(
              onPressed: MapState().onAddMarkerButtonPressed,
              child: Icon(Icons.add),
            ),
          ]),
        ],
      ),
    ]);
  }
}
