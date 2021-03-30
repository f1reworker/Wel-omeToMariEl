import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/placeList.dart';
import 'package:welcome_to_mari_el/placeListTab.dart';
import 'package:welcome_to_mari_el/mainPage/Map.dart';
import 'package:welcome_to_mari_el/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  @override
  FavoritePageState createState() => FavoritePageState();
}

bool search = false;
var favOrSearch = favoritePlace;

class FavoritePageState extends State<FavoritePage> {
  void initState() {
    super.initState();
    if (favoritePlace == [] && prefs.getStringList('listIndex') != null) {
      for (int i = 0; i < prefs.getStringList('listIndex').length; i++) {
        favoritePlace
            .add(place[int.parse(prefs.getStringList('listIndex')[i])]);
      }
      setState(() {});
    }
  }

  List duplicateItems = [];
  TextEditingController editingController = TextEditingController();
  Icon _searchIcon = search ? new Icon(Icons.close) : new Icon(Icons.search);
  Widget _appBarTitle = new Text('Поиск...');
  String query;
  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        search = true;
        duplicateItems.clear();
        duplicateItems.addAll(favoritePlace);
        favOrSearch = duplicateItems;
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          onChanged: (value) {
            filterSearchResults(value);
          },
          controller: editingController,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Поиск...'),
        );
      } else {
        favOrSearch = favoritePlace;
        search = false;
        this._appBarTitle = new Text('Поиск...');
        editingController.clear();
        this._searchIcon = new Icon(Icons.search);
      }
    });
  }

  void filterSearchResults(value) {
    List _searchPlace = [];
    duplicateItems.clear();
    duplicateItems.addAll(favoritePlace);
    for (int i = 0; i < duplicateItems.length; i++) {
      if (duplicateItems[i]["name"]
              .toLowerCase()
              .contains(value.toLowerCase()) ==
          true) {
        _searchPlace.add(duplicateItems[i]);
      }
    }
    print(value);
    duplicateItems.clear();
    duplicateItems.addAll(_searchPlace);
    favOrSearch = duplicateItems;
    setState(() {});
  }

  void deleteFavoritePlace(favoritePlace, index) {
    favoritePlace.remove(favOrSearch[index]);
    if (search) {
      setState(() {
        favOrSearch.removeAt(place.indexOf(placeOrSearch[index]));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: _appBarTitle, actions: <Widget>[
        new IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ]),
      body: Container(
        color: PrimaryColor,
        width: MediaQuery.of(context).size.width,
        child: new ListView.separated(
          itemCount: favOrSearch.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
          itemBuilder: (context, index) {
            return new Container(
                height: 101.4,
                child: Row(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 45,
                    child: TextButton(
                      onPressed: () {
                        indexPlace = place.indexOf(favOrSearch[index]);
                        Navigator.pushNamed(context, '/place');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, onPrimary: Colors.black),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 70,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child:
                                  Image.network(favOrSearch[index]["photo"][0]),
                            ),
                          ),
                          Column(children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 141,
                                  child: Text(
                                    favOrSearch[index]["name"],
                                    softWrap: true,
                                    textAlign: TextAlign.left,
                                    style: new TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              favOrSearch[index]["district"],
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 25,
                            height: 70,
                            child: IconButton(
                              onPressed: () {
                                indexPlace =
                                    place.indexOf(placeOrSearch[index]);
                                deleteFavoritePlace(favoritePlace, index);
                                setState(() {});
                                MapState().onAddMarker(indexPlace);
                              },
                              icon: Icon(Icons.star_outlined,
                                  color: Colors.amber, size: 35),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ]),
                ]));
          },
        ),
      ),
    );
  }
}
