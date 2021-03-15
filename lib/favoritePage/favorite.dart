import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/placeList.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';
import 'package:welcome_to_mari_el/searchPage/searchBar.dart';
import 'package:webdav/webdav.dart';

class FavoritePage extends StatefulWidget {
  @override
  FavoritePageState createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  TextEditingController editingController = TextEditingController();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Поиск...');
  List duplicateItems;

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        duplicateItems = favoritePlace;
        print(duplicateItems);
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
        this._appBarTitle = new Text('Поиск...');
        editingController.clear();
        this._searchIcon = new Icon(Icons.search);
        favoritePlace = duplicateItems;
      }
    });
  }

  void filterSearchResults(value) {
    setState(() {
      for (int i = 0; i < favoritePlace.length; i++) {
        if (favoritePlace[i]["name"]
                .toLowerCase()
                .contains(value.toLowerCase()) ==
            false) {
          favoritePlace.removeAt(i);
          i--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _appBarTitle,
        leading: new IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ),
      body: Container(
        color: PrimaryColor,
        width: MediaQuery.of(context).size.width,
        child: new ListView.separated(
          itemCount: favoritePlace.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
          itemBuilder: (context, index) {
            return new Container(
                height: 90,
                child: Row(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: TextButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, onPrimary: Colors.black),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 70,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.network(
                                  favoritePlace[index]["photo"][0]),
                            ),
                          ),
                          Column(children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 176,
                                  child: Text(
                                    favoritePlace[index]["name"],
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
                              favoritePlace[index]["district"],
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
                                deleteFavoritePlace(favoritePlace, index);
                                setState(() {});
                              },
                              icon: Icon(Icons.star_outlined,
                                  color: Colors.amber, size: 35),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 25,
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(CustomIcons.route, size: 25),
                              ),
                            ),
                          ),
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

void deleteFavoritePlace(favoritePlace, index) {
  favoritePlace.removeAt(index);
}
