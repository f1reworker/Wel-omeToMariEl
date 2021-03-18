import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/placeList.dart';
import 'package:welcome_to_mari_el/placeListTab.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';
import 'package:welcome_to_mari_el/favoritePage/favorite.dart';

void changeRoutingPlace(place, indexPlace) {
  routePlace.indexOf(place[indexPlace]) != -1
      ? routePlace.remove(place[indexPlace])
      : routePlace.add(place[indexPlace]);
}

class PlacePage extends StatefulWidget {
  PlacePage({Key key}) : super(key: key);

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  void changeFavorite(place, indexPlace) {
    favoritePlace.indexOf(place[indexPlace]) != -1
        ? favoritePlace.remove(place[indexPlace])
        : favoritePlace.add(place[indexPlace]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          place[indexPlace]["name"],
        ),
        actions: <Widget>[
          new IconButton(
            onPressed: () {
              changeFavorite(place, indexPlace);
            },
            icon: favoritePlace.indexOf(place[indexPlace]) != -1
                ? Icon(Icons.star_outlined)
                : Icon(Icons.star_outline_sharp),
            iconSize: 35,
            color: Colors.amber,
          ),
          new IconButton(
              onPressed: () {
                changeRoutingPlace(place, indexPlace);
                setState(() {});
              },
              icon: Icon(CustomIcons.route),
              iconSize: 25,
              color: routePlace.indexOf(place[indexPlace]) != -1
                  ? Colors.blueAccent
                  : Colors.white)
        ],
      ),
      body: Column(children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              child: Text(
            "   Район:" + place[indexPlace]["district"],
            textAlign: TextAlign.left,
          )),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(
              "   Категория:" + place[indexPlace]["what"],
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Container(
            height: 200, child: Image.network(place[indexPlace]["photo"][0])),
        Container(
          height: MediaQuery.of(context).size.height - 317,
          child: ListView(children: <Widget>[
            Text(
              place[indexPlace]["description"],
              softWrap: true,
            )
          ]),
        )
      ]),
    );
  }
}
