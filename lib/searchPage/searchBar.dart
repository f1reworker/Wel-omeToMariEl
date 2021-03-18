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
//Icon data = new Icon(Icons.search);

// class Filter extends ChangeNotifier {
//   bool search = false;

//   Icon get getSearchIcon => data;
//   void areSearching() {
//     search = !search;
//     search ? data = new Icon(Icons.close) : data = new Icon(Icons.search);
//     notifyListeners();
//   }
// }

class SearchList extends StatefulWidget {
  @override
  SearchListState createState() => SearchListState();
}

bool search = false;

class SearchListState extends State<SearchList> {
  TextEditingController editingController = TextEditingController();
  Icon _searchIcon = search ? new Icon(Icons.close) : new Icon(Icons.search);
  Widget _appBarTitle = new Text('Поиск...');
  List duplicateItems = [];
  void _searchPressed() {
    if (this._searchIcon.icon == Icons.search) {
      search = true;
      placeOrSearch = finalPlace;
      this._searchIcon = new Icon(Icons.close);
      this._appBarTitle = new TextField(
        onChanged: (value) {
          filterSearchResults(value);
        },
        controller: editingController,
        decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search), hintText: 'Поиск...'),
      );
      setState(() {});
    } else {
      this._appBarTitle = new Text('Поиск...');
      this._searchIcon = new Icon(Icons.search);
      editingController.clear();
      search = false;
      placeOrSearch = finalPlace;
      data = placeOrSearch;
      setState(() {});
    }
  }

  void filterSearchResults(value) {
    List _searchPlace = [];
    duplicateItems.clear();
    duplicateItems.addAll(finalPlace);
    for (int i = 0; i < duplicateItems.length; i++) {
      if (duplicateItems[i]["name"]
              .toLowerCase()
              .contains(value.toLowerCase()) ==
          true) {
        _searchPlace.add(duplicateItems[i]);
      }
    }
    placeOrSearch = _searchPlace;
    data = placeOrSearch;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilteredPlace>(create: (_) => FilteredPlace()),
        ChangeNotifierProvider<DistrictsFil>(create: (_) => DistrictsFil()),
        //ChangeNotifierProvider<Filter>(create: (_) => Filter()),
      ],
      child: Scaffold(
        appBar:
            AppBar(centerTitle: false, title: _appBarTitle, actions: <Widget>[
          new IconButton(
            icon: _searchIcon,
            onPressed: () {
              _searchPressed();
            },
          ),
        ]),
        body: Container(
          color: PrimaryColor,
          child: Column(children: <Widget>[
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
