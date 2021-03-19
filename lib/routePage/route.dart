import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/placeList.dart';
import 'package:welcome_to_mari_el/placeListTab.dart';
//import 'package:welcome_to_mari_el/favoritePage/favorite.dart';
import 'package:welcome_to_mari_el/main.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  void changeFavorite(place, indexPlace) {
    favoritePlace.indexOf(place[indexPlace]) != -1
        ? favoritePlace.remove(place[indexPlace])
        : favoritePlace.add(place[indexPlace]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Навигация")),
      body: Container(
        color: PrimaryColor,
        width: MediaQuery.of(context).size.width,
        child: new ListView.separated(
          itemCount: routePlace.length,
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
                      onPressed: () {
                        indexPlace = place.indexOf(routePlace[index]);
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
                                  Image.network(routePlace[index]["photo"][0]),
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
                                    routePlace[index]["name"],
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
                              routePlace[index]["district"],
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
                                indexPlace = place.indexOf(routePlace[index]);
                                changeFavorite(place, indexPlace);
                                setState(() {});
                              },
                              icon: Icon(
                                  favoritePlace.indexOf(routePlace[index]) != -1
                                      ? Icons.star_outlined
                                      : Icons.star_outline_sharp,
                                  color: Colors.amber,
                                  size: 35),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 25,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  routePlace.removeAt(index);
                                  setState(() {});
                                },
                                icon: Icon(CustomIcons.route,
                                    size: 25, color: Colors.blueAccent),
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
