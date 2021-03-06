import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/mainPage/Map.dart';
import 'package:welcome_to_mari_el/searchPage/DistrictsFilter.dart';
import 'package:welcome_to_mari_el/searchPage/searchFilter.dart';
import 'package:welcome_to_mari_el/data.dart';

const PrimaryColor = Color(0xFFFFFEFC);
LatLng markerPosition = LatLng(56.63011039048471, 47.918735914174235);
final Set<Marker> markers = {};

class SearchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DistrictsFil>(create: (_) => DistrictsFil()),
        ChangeNotifierProvider<SearchFil>(create: (_) => SearchFil()),
      ],
      child: Scaffold(
        body: Container(
          color: PrimaryColor,
          child: Column(children: <Widget>[
            SearchBar(),
            DistrictsFilter(),
            SearchFilter(),
            Fil(),
            Fil2(),
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
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          child: Row(children: [
            Icon(Icons.add),
            Text("     Добавить фильтры районов"),
          ]),
          onPressed: () {
            districtsCheckFunc();
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
            searchCheckFunc();
            showAlertDialogSearch(context);
          },
        ));
  }
}

class Fil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DistrictsFil>(
      create: (context) => DistrictsFil(),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(context.watch<DistrictsFil>().getData),
          ],
        ),
      ),
    );
  }
}

class Fil2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchFil>(
      create: (context) => SearchFil(),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(context.watch<SearchFil>().getData),
          ],
        ),
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
