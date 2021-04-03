import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/data.dart';
import 'package:welcome_to_mari_el/main.dart';
import 'package:welcome_to_mari_el/placeList.dart';
import 'package:welcome_to_mari_el/searchPage/DistrictsFilter.dart';
import 'package:welcome_to_mari_el/searchPage/searchFilter.dart';

class SearchList extends StatefulWidget {
  @override
  SearchListState createState() => SearchListState();
}

bool search = false;

class SearchListState extends State<SearchList> {
  void initState() {
    super.initState();
    getLocation();
    const oneSecond = const Duration(seconds: 3);
    new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
  }

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
            //DropDownList(),
            Flexible(
              child: PlaceList(),
            ),
          ]),
        ),
      ),
    );
  }
}

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

List<String> users = ["по умолчанию", "по расстоянию"];
String selectedUser = users[0];

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: PrimaryColor),
        margin: EdgeInsets.all(3),
        child: Center(
          child: Row(children: <Widget>[
            Text("Сортировка: ",
                style: new TextStyle(fontSize: 15.0, color: Colors.black)),
            DropdownButton<String>(
              value: selectedUser,
              // ignore: non_constant_identifier_names
              onChanged: (String Value) {
                setState(() {
                  selectedUser = Value;
                  SearchListState().initState();
                });
              },
              items: users.map((String user) {
                return DropdownMenuItem<String>(
                  value: user,
                  child: Text(user,
                      style:
                          new TextStyle(fontSize: 15.0, color: Colors.black)),
                );
              }).toList(),
            ),
          ]),
        ));
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
