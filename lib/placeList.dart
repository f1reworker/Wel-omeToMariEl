import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/mainPage/Map.dart';
import 'placeListTab.dart';
import 'package:welcome_to_mari_el/favoritePage/favorite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:location/location.dart';

List finalPlace = place;
List data = placeOrSearch;
int indexPlace;
SharedPreferences prefs;
List<String> dupFav = [];
void saveFavoritePlace(indexPlace) async {
  prefs = await SharedPreferences.getInstance();
  favoritePlace.indexOf(place[indexPlace]) != -1
      ? dupFav.add(indexPlace.toString())
      : dupFav.remove(indexPlace.toString());
  prefs.setStringList('listIndex', dupFav);
  print(prefs.getStringList('listIndex'));
  onAddMarker(indexPlace);
}

void filterPlace(districtsCheck, searchCheck) {
  finalPlace = [];
  for (int i = 0; i < place.length; i++) {
    if (districtsCheck.indexOf(place[i]["id"].split("")[0]) != -1 &&
        searchCheck.indexOf(place[i]["id"].split("")[1]) != -1) {
      finalPlace.add(place[i]);
      placeOrSearch = finalPlace;
    }
  }
}

LocationData _currentPosition;
Future getLocation() async {
  Location location = new Location();
  _currentPosition = await location.getLocation();
}

double calculateDistance(index) {
  var lat1, lat2, lon1, lon2;
  getLocation();
  lat2 = _currentPosition.latitude;
  lon2 = _currentPosition.longitude;
  lat1 = double.parse(placeOrSearch[index]["location"].split(",")[0]);
  lon1 = double.parse(placeOrSearch[index]["location"].split(",")[1]);
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

List placeOrSearch = finalPlace;

class FilteredPlace with ChangeNotifier {
  List get getData => data;
  void changeFinalPlace(placeOrSearch) {
    data = placeOrSearch;
    notifyListeners();
  }
}

class PlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilteredPlace>(create: (_) => FilteredPlace()),
        ChangeNotifierProvider<FavoritePlace>(create: (_) => FavoritePlace()),
      ],
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: new ListView.separated(
            itemCount: context.watch<FilteredPlace>().getData.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            itemBuilder: (context, index) {
              return new Container(
                  height: 122.4,
                  child: Row(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 45,
                      child: TextButton(
                        onPressed: () {
                          indexPlace = place.indexOf(placeOrSearch[index]);
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
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: Image.network(
                                    placeOrSearch[index]["photo"][0]),
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
                                      placeOrSearch[index]["name"],
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                placeOrSearch[index]["district"],
                                textAlign: TextAlign.left,
                                style: new TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                "Расстояние: " +
                                    calculateDistance(index)
                                        .toStringAsFixed(3) +
                                    " км",
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
                        child: Container(
                          width: 25,
                          height: 70,
                          child: Center(
                            child: IconButton(
                              padding: new EdgeInsets.all(0.0),
                              onPressed: () {
                                indexPlace =
                                    place.indexOf(placeOrSearch[index]);
                                context
                                    .read<FavoritePlace>()
                                    .changeFavoritePlace(
                                        favoritePlace, indexPlace);
                                saveFavoritePlace(indexPlace);
                              },
                              icon: Icon(
                                context
                                            .watch<FavoritePlace>()
                                            .getData
                                            .indexOf(placeOrSearch[index]) !=
                                        -1
                                    ? Icons.star_outlined
                                    : Icons.star_outline_sharp,
                                color: Colors.amber,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ]),
                  ]));
            },
          )),
    );
  }
}

class FavoritePlace with ChangeNotifier {
  List data = favoritePlace;
  List get getData => data;
  void changeFavoritePlace(favoritePlace, indexPlace) {
    favoritePlace.indexOf(place[indexPlace]) != -1
        ? favoritePlace.remove(place[indexPlace])
        : favoritePlace.add(place[indexPlace]);
    data = favoritePlace;
    notifyListeners();
  }
}
